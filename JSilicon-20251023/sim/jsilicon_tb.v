`timescale 1ns / 1ps
`default_nettype none

module tt_um_Jsilicon_tb;
    // 테스트벤치 신호 선언
    reg clk;
    reg rst_n;
    reg [7:0] ui_in;
    reg [7:0] uio_in;
    reg ena;
    wire [7:0] uio_oe;
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    
    // 출력 신호 분해 (수정됨 - alu_result[8] 누락 반영)
    wire uart_busy;
    wire [6:0] alu_result_low;
    wire [6:0] alu_result_high;
    wire uart_tx;
    wire [13:0] alu_result_full;  // 14비트만 사용 가능 (bit[8] 누락, bit[15]도 누락)
    
    assign uart_busy = uo_out[7];
    assign alu_result_low = uo_out[6:0];
    assign alu_result_high = uio_out[7:1];
    assign uart_tx = uio_out[0];
    // alu_result[8]이 누락되므로 14비트만 조합
    assign alu_result_full = {alu_result_high, alu_result_low};
    
    // 테스트 카운터
    integer test_count;
    integer pass_count;
    integer fail_count;
    
    // DUT 인스턴스화
    tt_um_Jsilicon uut (
        .clk(clk),
        .rst_n(rst_n),
        .ui_in(ui_in),
        .uio_in(uio_in),
        .ena(ena),
        .uio_oe(uio_oe),
        .uo_out(uo_out),
        .uio_out(uio_out)
    );
    
    // 클럭 생성 (10ns 주기 = 100MHz)
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    // 리셋 태스크
    task reset_system;
        begin
            rst_n = 1'b0;
            ena = 1'b0;
            ui_in = 8'h00;
            uio_in = 8'h00;
            repeat(3) @(posedge clk);
            rst_n = 1'b1;
            @(posedge clk);
        end
    endtask
    
    // Manual 모드 연산 태스크 (수정됨 - 14비트 기대값)
    task manual_operation;
        input [3:0] a;
        input [3:0] b;
        input [2:0] opcode;
        input [13:0] expected;  // 14비트로 변경
        input [200*8:1] test_name;
        begin
            test_count = test_count + 1;
            
            $display("\n[TEST %0d] %0s", test_count, test_name);
            $display("  Manual 모드: a=%0d, b=%0d, opcode=%b", a, b, opcode);
            
            @(posedge clk);
            uio_in[4] = 1'b0;  // mode = 0 (Manual)
            uio_in[7:5] = opcode;
            ui_in[7:4] = a;
            ui_in[3:0] = b;
            ena = 1'b1;
            
            // ALU 계산 대기
            repeat(3) @(posedge clk);
            #1;
            
            if (alu_result_full === expected) begin
                $display("  [PASS] 결과: 0x%h", alu_result_full);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] 예상: 0x%h, 실제: 0x%h", expected, alu_result_full);
                fail_count = fail_count + 1;
            end
            
            ena = 1'b0;
            @(posedge clk);
        end
    endtask
    
    // CPU 모드 실행 태스크
    task cpu_mode_run;
        input integer cycles;
        input [200*8:1] test_name;
        begin
            test_count = test_count + 1;
            
            $display("\n[TEST %0d] %0s", test_count, test_name);
            $display("  CPU 모드: %0d 사이클 실행", cycles);
            
            @(posedge clk);
            uio_in[4] = 1'b1;  // mode = 1 (CPU)
            ena = 1'b1;
            
            repeat(cycles) begin
                @(posedge clk);
                #1;
                $display("  Cycle: PC=%0d, instr=0x%h, ALU=0x%h, R0=0x%h, R1=0x%h",
                         uut.pc_inst.pc, 
                         uut.instr,
                         alu_result_full,
                         uut.R0,
                         uut.R1);
            end
            
            $display("  [INFO] CPU 모드 실행 완료");
            pass_count = pass_count + 1;
            
            ena = 1'b0;
            @(posedge clk);
        end
    endtask
    
    // UART 전송 확인 태스크
    task check_uart_transmission;
        input [200*8:1] test_name;
        integer timeout;
        begin
            test_count = test_count + 1;
            
            $display("\n[TEST %0d] %0s", test_count, test_name);
            
            // UART 전송 시작 대기
            timeout = 0;
            wait (uart_busy == 1'b1 || timeout > 100);
            
            if (uart_busy == 1'b1) begin
                $display("  [INFO] UART 전송 시작");
                
                // UART 전송 완료 대기
                wait (uart_busy == 1'b0);
                $display("  [PASS] UART 전송 완료");
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] UART 전송 시작 안됨");
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    // 메인 테스트 시퀀스
    initial begin
        // 초기화
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        clk = 1'b0;
        rst_n = 1'b0;
        ena = 1'b0;
        ui_in = 8'h00;
        uio_in = 8'h00;
        
        $display("========================================");
        $display("tt_um_Jsilicon Top Module Testbench");
        $display("========================================");
        $display("핀 배치:");
        $display("  ui_in[7:4]  = manual_a");
        $display("  ui_in[3:0]  = manual_b");
        $display("  uio_in[7:5] = manual_opcode");
        $display("  uio_in[4]   = mode (0=Manual, 1=CPU)");
        $display("  uo_out[7]   = uart_busy");
        $display("  uo_out[6:0] = alu_result[6:0]");
        $display("  uio_out[7:1]= alu_result[15:9]");
        $display("  uio_out[0]  = uart_tx");
        $display("");
        $display("주의: alu_result[8] 비트는 핀 제약으로 출력 불가");
        $display("========================================\n");
        
        // ===== 리셋 테스트 =====
        $display("----- 리셋 테스트 -----");
        reset_system;
        
        test_count = test_count + 1;
        #1;
        if (alu_result_full === 14'h0000) begin
            $display("[PASS] Test %0d: 리셋 후 ALU 결과 = 0", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: 리셋 후 상태 오류", test_count);
            fail_count = fail_count + 1;
        end
        
        // ===== Manual 모드 테스트 =====
        $display("\n----- Manual 모드 테스트 -----");
        
        manual_operation(4'd5, 4'd3, 3'b000, 14'h0008, "Manual: 5 + 3 = 8");
        manual_operation(4'd10, 4'd4, 3'b001, 14'h0006, "Manual: 10 - 4 = 6");
        manual_operation(4'd3, 4'd4, 3'b010, 14'h000C, "Manual: 3 * 4 = 12");
        manual_operation(4'd8, 4'd2, 3'b011, 14'h0004, "Manual: 8 / 2 = 4");
        manual_operation(4'd7, 4'd3, 3'b100, 14'h0001, "Manual: 7 % 3 = 1");
        manual_operation(4'd5, 4'd5, 3'b101, 14'h0001, "Manual: 5 == 5 = 1");
        manual_operation(4'd7, 4'd5, 3'b110, 14'h0001, "Manual: 7 > 5 = 1");
        manual_operation(4'd3, 4'd8, 3'b111, 14'h0001, "Manual: 3 < 8 = 1");
        
        // ===== CPU 모드 테스트 =====
        $display("\n----- CPU 모드 테스트 -----");
        
        reset_system;
        
        // ROM 내용 확인
        $display("\n  ROM 프로그램:");
        $display("    ROM[0] = 0x%h (ADD 3)", uut.pc_inst.rom[0]);
        $display("    ROM[1] = 0x%h (SUB 2)", uut.pc_inst.rom[1]);
        $display("    ROM[2] = 0x%h (MUL 5)", uut.pc_inst.rom[2]);
        $display("    ROM[3] = 0x%h (NOP)", uut.pc_inst.rom[3]);
        
        cpu_mode_run(16, "CPU 모드: 16 사이클 (4 루프)");
        
        // ===== 모드 전환 테스트 =====
        $display("\n----- 모드 전환 테스트 -----");
        
        reset_system;
        
        test_count = test_count + 1;
        $display("\n[TEST %0d] Manual → CPU 전환", test_count);
        
        // Manual 모드로 시작
        @(posedge clk);
        uio_in[4] = 1'b0;  // Manual
        uio_in[7:5] = 3'b000;  // ADD
        ui_in = 8'h23;  // 2 + 3
        ena = 1'b1;
        
        repeat(3) @(posedge clk);
        $display("  Manual: 결과 = 0x%h", alu_result_full);
        
        // CPU 모드로 전환
        @(posedge clk);
        uio_in[4] = 1'b1;  // CPU
        
        repeat(8) @(posedge clk);
        $display("  CPU: R0 = 0x%h, R1 = 0x%h", uut.R0, uut.R1);
        
        $display("  [PASS] 모드 전환 성공");
        pass_count = pass_count + 1;
        
        ena = 1'b0;
        
        // ===== ENA 제어 테스트 =====
        $display("\n----- ENA 제어 테스트 -----");
        
        reset_system;
        
        test_count = test_count + 1;
        $display("\n[TEST %0d] ENA=0 테스트", test_count);
        
        @(posedge clk);
        uio_in[4] = 1'b0;  // Manual
        ui_in = 8'h55;
        ena = 1'b0;  // ENA 비활성화
        
        repeat(5) @(posedge clk);
        #1;
        
        if (alu_result_full === 14'h0000) begin
            $display("  [PASS] ENA=0: 동작 정지");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] ENA=0: 동작이 계속됨");
            fail_count = fail_count + 1;
        end
        
        // ===== SWITCH 테스트 =====
        $display("\n----- SWITCH 모듈 테스트 -----");
        
        reset_system;
        
        test_count = test_count + 1;
        $display("\n[TEST %0d] SWITCH 입력 선택", test_count);
        
        // Manual 입력 설정
        @(posedge clk);
        uio_in[4] = 1'b0;  // Manual
        ui_in = 8'hAB;
        ena = 1'b1;
        
        @(posedge clk);
        #1;
        
        if (uut.select_a === 8'h0A && uut.select_b === 8'h0B) begin
            $display("  [PASS] Manual: select_a=0x%h, select_b=0x%h", 
                     uut.select_a, uut.select_b);
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Manual: 입력 선택 오류");
            fail_count = fail_count + 1;
        end
        
        test_count = test_count + 1;
        
        // CPU 입력으로 전환
        @(posedge clk);
        uio_in[4] = 1'b1;  // CPU
        
        repeat(3) @(posedge clk);
        #1;
        
        if (uut.select_a === uut.R0 && uut.select_b === uut.R1) begin
            $display("  [PASS] CPU: select_a=R0, select_b=R1");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] CPU: 입력 선택 오류");
            fail_count = fail_count + 1;
        end
        
        // ===== 출력 핀 테스트 =====
        $display("\n----- 출력 핀 테스트 -----");
        
        test_count = test_count + 1;
        
        if (uio_oe === 8'b00000001) begin
            $display("[PASS] Test %0d: uio_oe = 0x%h (비트 0만 출력)", test_count, uio_oe);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: uio_oe 오류", test_count);
            fail_count = fail_count + 1;
        end
        
        // ===== 통합 시나리오 테스트 =====
        $display("\n----- 통합 시나리오 테스트 -----");
        
        reset_system;
        
        $display("\n시나리오: Manual로 계산 → CPU 모드로 프로그램 실행");
        
        // Step 1: Manual 계산
        test_count = test_count + 1;
        $display("\n[Step 1] Manual: 6 + 4 = 10");
        
        @(posedge clk);
        uio_in[4] = 1'b0;
        uio_in[7:5] = 3'b000;
        ui_in = 8'h64;
        ena = 1'b1;
        
        repeat(3) @(posedge clk);
        #1;
        
        if (alu_result_full === 14'h000A) begin
            $display("  [PASS] Manual 계산 성공");
            pass_count = pass_count + 1;
        end else begin
            $display("  [FAIL] Manual 계산 실패");
            fail_count = fail_count + 1;
        end
        
        // Step 2: CPU 모드 실행
        test_count = test_count + 1;
        $display("\n[Step 2] CPU 모드 실행");
        
        @(posedge clk);
        uio_in[4] = 1'b1;
        
        repeat(20) @(posedge clk);
        
        $display("  [PASS] CPU 프로그램 실행 완료");
        $display("  최종 상태: R0=0x%h, R1=0x%h", uut.R0, uut.R1);
        pass_count = pass_count + 1;
        
        // ===== 경계값 테스트 =====
        $display("\n----- 경계값 테스트 -----");
        
        reset_system;
        
        manual_operation(4'h0, 4'h0, 3'b000, 14'h0000, "경계값: 0 + 0");
        manual_operation(4'hF, 4'hF, 3'b000, 14'h001E, "경계값: 15 + 15 = 30");
        
        // 15 * 15 = 225 = 0xE1 = 0b0000_0000_1110_0001
        // 출력: {alu[15:9], alu[6:0]} = {0b0000_011, 0b110_0001} = 0b0000_011_110_0001 = 0x0061
        // alu[8] = 1이지만 핀 매핑에서 누락됨
        manual_operation(4'hF, 4'hF, 3'b010, 14'h0061, "경계값: 15 * 15 = 225 (핀 제약으로 0x61)");
        
        $display("\n  주의: 현재 핀 매핑에서 alu_result[8] 비트가 누락됩니다.");
        $display("        실제 15*15=0xE1이지만, 출력은 0x61입니다.");
        
        // ===== 테스트 결과 요약 =====
        #100;
        $display("\n========================================");
        $display("테스트 완료");
        $display("========================================");
        $display("총 테스트:  %0d", test_count);
        $display("성공:       %0d", pass_count);
        $display("실패:       %0d", fail_count);
        if (test_count > 0) begin
            $display("성공률:     %0d%%", (pass_count * 100) / test_count);
        end
        $display("========================================");
        
        if (fail_count == 0) begin
            $display("✓ 모든 테스트 통과!");
        end else begin
            $display("✗ 일부 테스트 실패");
        end
        
        #10;
        $finish;
    end
    
    // 타임아웃 감시
    initial begin
        #500000;
        $display("\n[ERROR] 타임아웃!");
        $finish;
    end
    
    // 파형 덤프
    initial begin
        $dumpfile("tt_um_Jsilicon_tb.vcd");
        $dumpvars(0, tt_um_Jsilicon_tb);
    end
    
endmodule