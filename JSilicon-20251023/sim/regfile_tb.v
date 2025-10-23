`timescale 1ns / 1ps
`default_nettype none

module REG_tb;
    // 테스트벤치 신호 선언
    reg clock;
    reg reset;
    reg ena;
    reg [2:0] opcode;
    reg [7:0] data_in;
    wire [7:0] R0_out;
    wire [7:0] R1_out;
    
    // 테스트 카운터
    integer test_count;
    integer pass_count;
    integer fail_count;
    
    // REG 모듈 인스턴스화
    REG uut (
        .clock(clock),
        .reset(reset),
        .ena(ena),
        .opcode(opcode),
        .data_in(data_in),
        .R0_out(R0_out),
        .R1_out(R1_out)
    );
    
    // 클럭 생성 (10ns 주기 = 100MHz)
    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end
    
    // 결과 검증 태스크
    task check_registers;
        input [7:0] exp_R0;
        input [7:0] exp_R1;
        input [200*8:1] test_name;
        begin
            test_count = test_count + 1;
            @(posedge clock);
            @(posedge clock);
            #1;
            
            if (R0_out === exp_R0 && R1_out === exp_R1) begin
                $display("[PASS] Test %0d: %0s", test_count, test_name);
                $display("       R0=0x%h, R1=0x%h", R0_out, R1_out);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Test %0d: %0s", test_count, test_name);
                $display("       Expected: R0=0x%h, R1=0x%h", exp_R0, exp_R1);
                $display("       Got:      R0=0x%h, R1=0x%h", R0_out, R1_out);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    // 리셋 태스크
    task reset_dut;
        begin
            reset = 1'b1;
            ena = 1'b0;
            opcode = 3'b000;
            data_in = 8'h00;
            repeat(2) @(posedge clock);
            reset = 1'b0;
            @(posedge clock);
        end
    endtask
    
    // 레지스터 로드 태스크 (수정: 클럭 대기 추가)
    task load_register;
        input reg_sel;  // 0=R0, 1=R1
        input [7:0] value;
        begin
            @(posedge clock);
            ena = 1'b1;
            opcode = reg_sel ? 3'b001 : 3'b000;
            data_in = value;
            @(posedge clock);
            #1; // 안정화 대기
        end
    endtask
    
    // 레지스터 이동 태스크 (수정: 클럭 대기 추가)
    task move_register;
        input direction;  // 0=R0→R1, 1=R1→R0
        begin
            @(posedge clock);
            ena = 1'b1;
            opcode = direction ? 3'b011 : 3'b010;
            data_in = 8'h00;
            @(posedge clock);
            #1; // 안정화 대기
        end
    endtask
    
    // 메인 테스트 시퀀스
    initial begin
        // 초기화
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        clock = 1'b0;
        reset = 1'b0;
        ena = 1'b0;
        opcode = 3'b000;
        data_in = 8'h00;
        
        $display("========================================");
        $display("REG (Register File) Testbench");
        $display("========================================");
        $display("opcode 정의:");
        $display("  000: LOAD R0");
        $display("  001: LOAD R1");
        $display("  010: MOV R0→R1");
        $display("  011: MOV R1→R0");
        $display("  1xx: NOP");
        $display("========================================\n");
        
        // ===== 리셋 테스트 =====
        $display("----- 리셋 테스트 -----");
        reset_dut;
        check_registers(8'h00, 8'h00, "리셋 후 R0=0, R1=0");
        
        // ===== ENA=0 테스트 =====
        $display("\n----- ENA=0 테스트 -----");
        ena = 1'b0;
        opcode = 3'b000;
        data_in = 8'hFF;
        check_registers(8'h00, 8'h00, "ENA=0: 레지스터 변경 없음");
        
        // ===== LOAD R0 테스트 =====
        $display("\n----- LOAD R0 테스트 -----");
        
        load_register(0, 8'h12);
        test_count = test_count + 1;
        if (R0_out === 8'h12 && R1_out === 8'h00) begin
            $display("[PASS] Test %0d: LOAD R0, 0x12", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: LOAD R0, 0x12", test_count);
            $display("  Got: R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        load_register(0, 8'hAB);
        test_count = test_count + 1;
        if (R0_out === 8'hAB && R1_out === 8'h00) begin
            $display("[PASS] Test %0d: LOAD R0, 0xAB", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: LOAD R0, 0xAB", test_count);
            $display("  Got: R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        // ===== LOAD R1 테스트 =====
        $display("\n----- LOAD R1 테스트 -----");
        
        load_register(1, 8'h34);
        test_count = test_count + 1;
        if (R0_out === 8'hAB && R1_out === 8'h34) begin
            $display("[PASS] Test %0d: LOAD R1, 0x34", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: LOAD R1, 0x34", test_count);
            $display("  Got: R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        // ===== MOV R0→R1 테스트 =====
        $display("\n----- MOV R0→R1 테스트 -----");
        
        reset_dut;
        load_register(0, 8'h55);
        load_register(1, 8'h00);
        
        $display("  MOV 전: R0=0x%h, R1=0x%h", R0_out, R1_out);
        
        move_register(0);  // R0→R1
        
        test_count = test_count + 1;
        if (R0_out === 8'h55 && R1_out === 8'h55) begin
            $display("[PASS] Test %0d: MOV R0→R1", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: MOV R0→R1", test_count);
            $display("  Expected: R0=0x55, R1=0x55");
            $display("  Got:      R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        $display("  MOV 후: R0=0x%h, R1=0x%h", R0_out, R1_out);
        
        // ===== MOV R1→R0 테스트 =====
        $display("\n----- MOV R1→R0 테스트 -----");
        
        reset_dut;
        load_register(0, 8'h00);
        load_register(1, 8'h99);
        
        $display("  MOV 전: R0=0x%h, R1=0x%h", R0_out, R1_out);
        
        move_register(1);  // R1→R0
        
        test_count = test_count + 1;
        if (R0_out === 8'h99 && R1_out === 8'h99) begin
            $display("[PASS] Test %0d: MOV R1→R0", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: MOV R1→R0", test_count);
            $display("  Expected: R0=0x99, R1=0x99");
            $display("  Got:      R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        $display("  MOV 후: R0=0x%h, R1=0x%h", R0_out, R1_out);
        
        // ===== NOP 테스트 =====
        $display("\n----- NOP 테스트 -----");
        
        reset_dut;
        load_register(0, 8'h42);
        load_register(1, 8'h24);
        
        $display("  NOP 전: R0=0x%h, R1=0x%h", R0_out, R1_out);
        
        ena = 1'b1;
        opcode = 3'b100;
        data_in = 8'hFF;
        @(posedge clock);
        #1;
        
        test_count = test_count + 1;
        if (R0_out === 8'h42 && R1_out === 8'h24) begin
            $display("[PASS] Test %0d: opcode=100 NOP", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: opcode=100 NOP", test_count);
            $display("  Got: R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        opcode = 3'b101;
        @(posedge clock);
        #1;
        
        test_count = test_count + 1;
        if (R0_out === 8'h42 && R1_out === 8'h24) begin
            $display("[PASS] Test %0d: opcode=101 NOP", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: opcode=101 NOP", test_count);
            $display("  Got: R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        // ===== 연속 동작 테스트 =====
        $display("\n----- 연속 동작 테스트 -----");
        
        reset_dut;
        
        load_register(0, 8'h0A);
        $display("  Step 1: R0=0x%h, R1=0x%h", R0_out, R1_out);
        
        load_register(1, 8'h14);
        $display("  Step 2: R0=0x%h, R1=0x%h", R0_out, R1_out);
        
        move_register(0);  // R0→R1
        $display("  Step 3: R0=0x%h, R1=0x%h", R0_out, R1_out);
        
        test_count = test_count + 1;
        if (R0_out === 8'h0A && R1_out === 8'h0A) begin
            $display("[PASS] Test %0d: 연속 동작", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: 연속 동작", test_count);
            $display("  Expected: R0=0x0A, R1=0x0A");
            $display("  Got:      R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        // ===== 경계값 테스트 =====
        $display("\n----- 경계값 테스트 -----");
        
        reset_dut;
        
        load_register(0, 8'h00);
        load_register(1, 8'h00);
        
        test_count = test_count + 1;
        if (R0_out === 8'h00 && R1_out === 8'h00) begin
            $display("[PASS] Test %0d: 최소값 (0x00)", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: 최소값", test_count);
            $display("  Got: R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        load_register(0, 8'hFF);
        load_register(1, 8'hFF);
        
        test_count = test_count + 1;
        if (R0_out === 8'hFF && R1_out === 8'hFF) begin
            $display("[PASS] Test %0d: 최대값 (0xFF)", test_count);
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] Test %0d: 최대값", test_count);
            $display("  Got: R0=0x%h, R1=0x%h", R0_out, R1_out);
            fail_count = fail_count + 1;
        end
        
        // ===== 스트레스 테스트 =====
        $display("\n----- 스트레스 테스트 -----");
        
        begin : stress_test
            integer i;
            reg [7:0] test_value;
            integer error_count;
            
            error_count = 0;
            reset_dut;
            
            for (i = 0; i < 16; i = i + 1) begin
                test_value = i * 16;
                
                load_register(0, test_value);
                load_register(1, test_value + 8);
                move_register(0);  // R0→R1
                
                // 충분한 대기 시간
                @(posedge clock);
                #1;
                
                if (R0_out !== test_value || R1_out !== test_value) begin
                    error_count = error_count + 1;
                    $display("  [ERROR] 반복 %0d: 예상 0x%h, 실제 R0=0x%h R1=0x%h", 
                             i, test_value, R0_out, R1_out);
                end
            end
            
            test_count = test_count + 1;
            if (error_count == 0) begin
                $display("[PASS] Test %0d: 스트레스 테스트 (16회)", test_count);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Test %0d: 스트레스 테스트 (%0d개 오류)", 
                         test_count, error_count);
                fail_count = fail_count + 1;
            end
        end
        
        // ===== 테스트 결과 요약 =====
        #20;
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
        #100000;
        $display("\n[ERROR] 타임아웃!");
        $finish;
    end
    
    // 파형 덤프
    initial begin
        $dumpfile("reg_tb.vcd");
        $dumpvars(0, REG_tb);
    end
    
endmodule