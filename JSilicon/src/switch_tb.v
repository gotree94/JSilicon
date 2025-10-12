`timescale 1ns / 1ps
`default_nettype none

module SWITCH_tb;
    // 테스트벤치 신호 선언
    reg mode;
    reg [7:0] manual_a;
    reg [7:0] manual_b;
    reg [2:0] manual_opcode;
    reg [7:0] cpu_a;
    reg [7:0] cpu_b;
    reg [2:0] cpu_opcode;
    wire [7:0] select_a;
    wire [7:0] select_b;
    wire [2:0] select_opcode;
    
    // 테스트 카운터
    integer test_count;
    integer pass_count;
    integer fail_count;
    
    // SWITCH 모듈 인스턴스화
    SWITCH uut (
        .mode(mode),
        .manual_a(manual_a),
        .manual_b(manual_b),
        .manual_opcode(manual_opcode),
        .cpu_a(cpu_a),
        .cpu_b(cpu_b),
        .cpu_opcode(cpu_opcode),
        .select_a(select_a),
        .select_b(select_b),
        .select_opcode(select_opcode)
    );
    
    // 결과 검증 태스크
    task check_output;
        input [7:0] exp_a;
        input [7:0] exp_b;
        input [2:0] exp_opcode;
        input [200*8:1] test_name;
        begin
            test_count = test_count + 1;
            #1; // 조합 논리 안정화 대기
            
            if (select_a === exp_a && select_b === exp_b && select_opcode === exp_opcode) begin
                $display("[PASS] Test %0d: %0s", test_count, test_name);
                $display("       mode=%b → a=0x%h, b=0x%h, opcode=%b",
                         mode, select_a, select_b, select_opcode);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Test %0d: %0s", test_count, test_name);
                $display("       mode=%b", mode);
                $display("       Expected: a=0x%h, b=0x%h, opcode=%b", 
                         exp_a, exp_b, exp_opcode);
                $display("       Got:      a=0x%h, b=0x%h, opcode=%b", 
                         select_a, select_b, select_opcode);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    // 입력 설정 태스크
    task set_manual_inputs;
        input [7:0] a;
        input [7:0] b;
        input [2:0] op;
        begin
            manual_a = a;
            manual_b = b;
            manual_opcode = op;
        end
    endtask
    
    task set_cpu_inputs;
        input [7:0] a;
        input [7:0] b;
        input [2:0] op;
        begin
            cpu_a = a;
            cpu_b = b;
            cpu_opcode = op;
        end
    endtask
    
    // 상태 출력 태스크
    task display_status;
        input [200*8:1] label;
        begin
            $display("\n%0s:", label);
            $display("  mode = %b (%s)", mode, mode ? "CPU" : "Manual");
            $display("  Manual: a=0x%h, b=0x%h, opcode=%b", 
                     manual_a, manual_b, manual_opcode);
            $display("  CPU:    a=0x%h, b=0x%h, opcode=%b", 
                     cpu_a, cpu_b, cpu_opcode);
            $display("  Output: a=0x%h, b=0x%h, opcode=%b", 
                     select_a, select_b, select_opcode);
        end
    endtask
    
    // 메인 테스트 시퀀스
    initial begin
        // 초기화
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        mode = 1'b0;
        manual_a = 8'h00;
        manual_b = 8'h00;
        manual_opcode = 3'b000;
        cpu_a = 8'h00;
        cpu_b = 8'h00;
        cpu_opcode = 3'b000;
        
        $display("========================================");
        $display("SWITCH (Mode Selector) Testbench");
        $display("========================================");
        $display("모드 설명:");
        $display("  mode=0: Manual 모드 (외부 제어)");
        $display("  mode=1: CPU 모드 (내장 ROM 실행)");
        $display("========================================\n");
        
        // ===== 초기 상태 테스트 =====
        $display("----- 초기 상태 테스트 -----");
        #1;
        check_output(8'h00, 8'h00, 3'b000, "초기 상태: mode=0, 모든 입력 0");
        
        // ===== Manual 모드 (mode=0) 테스트 =====
        $display("\n----- Manual 모드 (mode=0) 테스트 -----");
        
        mode = 1'b0;
        
        // 테스트 1: 기본 값
        set_manual_inputs(8'h12, 8'h34, 3'b000);
        set_cpu_inputs(8'hAA, 8'hBB, 3'b111);
        check_output(8'h12, 8'h34, 3'b000, "Manual: a=0x12, b=0x34, opcode=000");
        
        // 테스트 2: 다른 값
        set_manual_inputs(8'h55, 8'h66, 3'b001);
        set_cpu_inputs(8'hCC, 8'hDD, 3'b110);
        check_output(8'h55, 8'h66, 3'b001, "Manual: a=0x55, b=0x66, opcode=001");
        
        // 테스트 3: 최대값
        set_manual_inputs(8'hFF, 8'hFF, 3'b111);
        set_cpu_inputs(8'h00, 8'h00, 3'b000);
        check_output(8'hFF, 8'hFF, 3'b111, "Manual: 최대값 (0xFF, 0xFF, 111)");
        
        // 테스트 4: 최소값
        set_manual_inputs(8'h00, 8'h00, 3'b000);
        set_cpu_inputs(8'hFF, 8'hFF, 3'b111);
        check_output(8'h00, 8'h00, 3'b000, "Manual: 최소값 (0x00, 0x00, 000)");
        
        // 테스트 5: 다양한 opcode
        set_manual_inputs(8'h10, 8'h20, 3'b010);
        check_output(8'h10, 8'h20, 3'b010, "Manual: opcode=010 (MUL)");
        
        set_manual_inputs(8'h30, 8'h40, 3'b011);
        check_output(8'h30, 8'h40, 3'b011, "Manual: opcode=011 (DIV)");
        
        set_manual_inputs(8'h50, 8'h60, 3'b100);
        check_output(8'h50, 8'h60, 3'b100, "Manual: opcode=100 (MOD)");
        
        set_manual_inputs(8'h70, 8'h80, 3'b101);
        check_output(8'h70, 8'h80, 3'b101, "Manual: opcode=101 (CMP ==)");
        
        set_manual_inputs(8'h90, 8'hA0, 3'b110);
        check_output(8'h90, 8'hA0, 3'b110, "Manual: opcode=110 (CMP >)");
        
        // ===== CPU 모드 (mode=1) 테스트 =====
        $display("\n----- CPU 모드 (mode=1) 테스트 -----");
        
        mode = 1'b1;
        
        // 테스트 1: 기본 값
        set_manual_inputs(8'h11, 8'h22, 3'b000);
        set_cpu_inputs(8'hAA, 8'hBB, 3'b111);
        check_output(8'hAA, 8'hBB, 3'b111, "CPU: a=0xAA, b=0xBB, opcode=111");
        
        // 테스트 2: 다른 값
        set_manual_inputs(8'h33, 8'h44, 3'b001);
        set_cpu_inputs(8'hCC, 8'hDD, 3'b110);
        check_output(8'hCC, 8'hDD, 3'b110, "CPU: a=0xCC, b=0xDD, opcode=110");
        
        // 테스트 3: 최대값
        set_manual_inputs(8'h00, 8'h00, 3'b000);
        set_cpu_inputs(8'hFF, 8'hFF, 3'b111);
        check_output(8'hFF, 8'hFF, 3'b111, "CPU: 최대값 (0xFF, 0xFF, 111)");
        
        // 테스트 4: 최소값
        set_manual_inputs(8'hFF, 8'hFF, 3'b111);
        set_cpu_inputs(8'h00, 8'h00, 3'b000);
        check_output(8'h00, 8'h00, 3'b000, "CPU: 최소값 (0x00, 0x00, 000)");
        
        // 테스트 5: 다양한 opcode
        set_cpu_inputs(8'h01, 8'h02, 3'b010);
        check_output(8'h01, 8'h02, 3'b010, "CPU: opcode=010 (MUL)");
        
        set_cpu_inputs(8'h03, 8'h04, 3'b011);
        check_output(8'h03, 8'h04, 3'b011, "CPU: opcode=011 (DIV)");
        
        set_cpu_inputs(8'h05, 8'h06, 3'b100);
        check_output(8'h05, 8'h06, 3'b100, "CPU: opcode=100 (MOD)");
        
        set_cpu_inputs(8'h07, 8'h08, 3'b101);
        check_output(8'h07, 8'h08, 3'b101, "CPU: opcode=101 (CMP ==)");
        
        set_cpu_inputs(8'h09, 8'h0A, 3'b110);
        check_output(8'h09, 8'h0A, 3'b110, "CPU: opcode=110 (CMP >)");
        
        // ===== 모드 전환 테스트 =====
        $display("\n----- 모드 전환 테스트 -----");
        
        // 고정 입력 설정
        set_manual_inputs(8'hAA, 8'hBB, 3'b010);
        set_cpu_inputs(8'h11, 8'h22, 3'b101);
        
        // Manual → CPU
        mode = 1'b0;
        check_output(8'hAA, 8'hBB, 3'b010, "모드 전환: Manual 선택");
        
        mode = 1'b1;
        check_output(8'h11, 8'h22, 3'b101, "모드 전환: CPU 선택");
        
        // CPU → Manual
        mode = 1'b1;
        check_output(8'h11, 8'h22, 3'b101, "모드 전환: CPU 유지");
        
        mode = 1'b0;
        check_output(8'hAA, 8'hBB, 3'b010, "모드 전환: Manual 복귀");
        
        // ===== 빠른 모드 전환 테스트 =====
        $display("\n----- 빠른 모드 전환 테스트 -----");
        
        set_manual_inputs(8'h55, 8'h66, 3'b001);
        set_cpu_inputs(8'h77, 8'h88, 3'b110);
        
        begin : rapid_switch
            integer i;
            for (i = 0; i < 10; i = i + 1) begin
                mode = i[0]; // 0, 1, 0, 1, ...
                #1;
                if (mode == 1'b0) begin
                    if (select_a !== 8'h55 || select_b !== 8'h66 || select_opcode !== 3'b001) begin
                        $display("[ERROR] 빠른 전환 %0d: Manual 모드 오류", i);
                        fail_count = fail_count + 1;
                    end
                end else begin
                    if (select_a !== 8'h77 || select_b !== 8'h88 || select_opcode !== 3'b110) begin
                        $display("[ERROR] 빠른 전환 %0d: CPU 모드 오류", i);
                        fail_count = fail_count + 1;
                    end
                end
            end
            test_count = test_count + 1;
            pass_count = pass_count + 1;
            $display("[PASS] 빠른 모드 전환 10회 성공");
        end
        
        // ===== 동시 입력 변경 테스트 =====
        $display("\n----- 동시 입력 변경 테스트 -----");
        
        mode = 1'b0;
        
        // 모든 입력을 동시에 변경
        manual_a = 8'h12;
        manual_b = 8'h34;
        manual_opcode = 3'b010;
        cpu_a = 8'h56;
        cpu_b = 8'h78;
        cpu_opcode = 3'b101;
        
        check_output(8'h12, 8'h34, 3'b010, "동시 변경: Manual 모드");
        
        mode = 1'b1;
        check_output(8'h56, 8'h78, 3'b101, "동시 변경: CPU 모드");
        
        // ===== X/Z 값 테스트 =====
        $display("\n----- X/Z 값 처리 테스트 -----");
        
        mode = 1'b0;
        manual_a = 8'hXX;
        manual_b = 8'hZZ;
        manual_opcode = 3'bXXX;
        cpu_a = 8'h00;
        cpu_b = 8'h00;
        cpu_opcode = 3'b000;
        
        #1;
        $display("  X/Z 테스트: mode=0");
        $display("    select_a = 0x%h (X 포함)", select_a);
        $display("    select_b = 0x%h (Z 포함)", select_b);
        $display("    select_opcode = %b (X 포함)", select_opcode);
        
        mode = 1'b1;
        #1;
        check_output(8'h00, 8'h00, 3'b000, "X/Z 테스트: CPU 모드 (정상값)");
        
        // 정상값으로 복구
        manual_a = 8'h00;
        manual_b = 8'h00;
        manual_opcode = 3'b000;
        
        // ===== 경계값 테스트 =====
        $display("\n----- 경계값 테스트 -----");
        
        mode = 1'b0;
        
        // a 경계값
        set_manual_inputs(8'h00, 8'h50, 3'b000);
        check_output(8'h00, 8'h50, 3'b000, "경계값: a=0x00 (최소)");
        
        set_manual_inputs(8'hFF, 8'h50, 3'b000);
        check_output(8'hFF, 8'h50, 3'b000, "경계값: a=0xFF (최대)");
        
        // b 경계값
        set_manual_inputs(8'h50, 8'h00, 3'b000);
        check_output(8'h50, 8'h00, 3'b000, "경계값: b=0x00 (최소)");
        
        set_manual_inputs(8'h50, 8'hFF, 3'b000);
        check_output(8'h50, 8'hFF, 3'b000, "경계값: b=0xFF (최대)");
        
        // opcode 경계값
        set_manual_inputs(8'h50, 8'h60, 3'b000);
        check_output(8'h50, 8'h60, 3'b000, "경계값: opcode=000 (최소)");
        
        set_manual_inputs(8'h50, 8'h60, 3'b111);
        check_output(8'h50, 8'h60, 3'b111, "경계값: opcode=111 (최대)");
        
        // ===== 모든 opcode 순회 테스트 =====
        $display("\n----- 모든 opcode 순회 테스트 -----");
        
        begin : all_opcodes
            integer j;
            reg [2:0] test_op;
            
            mode = 1'b0;
            set_manual_inputs(8'hA0, 8'hB0, 3'b000);
            
            for (j = 0; j < 8; j = j + 1) begin
                test_op = j[2:0];
                manual_opcode = test_op;
                #1;
                
                if (select_opcode === test_op) begin
                    $display("  [PASS] opcode=%b 선택됨", test_op);
                end else begin
                    $display("  [FAIL] opcode=%b 선택 실패", test_op);
                    fail_count = fail_count + 1;
                end
            end
            test_count = test_count + 1;
            pass_count = pass_count + 1;
            $display("[INFO] 모든 opcode 순회 완료");
        end
        
        // ===== 패턴 테스트 =====
        $display("\n----- 패턴 테스트 -----");
        
        mode = 1'b0;
        
        // 0xAA 패턴
        set_manual_inputs(8'hAA, 8'hAA, 3'b101);
        check_output(8'hAA, 8'hAA, 3'b101, "패턴: 0xAA (10101010)");
        
        // 0x55 패턴
        set_manual_inputs(8'h55, 8'h55, 3'b010);
        check_output(8'h55, 8'h55, 3'b010, "패턴: 0x55 (01010101)");
        
        // 0xF0 패턴
        set_manual_inputs(8'hF0, 8'h0F, 3'b110);
        check_output(8'hF0, 8'h0F, 3'b110, "패턴: 0xF0, 0x0F");
        
        // ===== 종합 시나리오 테스트 =====
        $display("\n----- 종합 시나리오 테스트 -----");
        
        $display("  시나리오: CPU가 계산 중, Manual로 전환하여 외부 제어");
        
        // CPU 모드로 설정
        mode = 1'b1;
        set_cpu_inputs(8'h10, 8'h20, 3'b000); // ADD 10 + 20
        display_status("Step 1: CPU 모드 (ADD)");
        check_output(8'h10, 8'h20, 3'b000, "시나리오 1: CPU 모드");
        
        // Manual 모드로 전환
        mode = 1'b0;
        set_manual_inputs(8'h05, 8'h03, 3'b001); // SUB 5 - 3
        display_status("Step 2: Manual 모드 (SUB)");
        check_output(8'h05, 8'h03, 3'b001, "시나리오 2: Manual 모드");
        
        // 다시 CPU 모드로
        mode = 1'b1;
        set_cpu_inputs(8'h04, 8'h07, 3'b010); // MUL 4 * 7
        display_status("Step 3: CPU 모드 복귀 (MUL)");
        check_output(8'h04, 8'h07, 3'b010, "시나리오 3: CPU 모드 복귀");
        
        // ===== 최종 상태 확인 =====
        $display("\n----- 최종 상태 확인 -----");
        display_status("최종 상태");
        
        // ===== 테스트 결과 요약 =====
        #10;
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
    
    // 파형 덤프
    initial begin
        $dumpfile("switch_tb.vcd");
        $dumpvars(0, SWITCH_tb);
    end
    
    // 실시간 모니터링 (디버깅용, 필요시 주석 해제)
    /*
    always @(*) begin
        $display("@%0t: mode=%b, manual=(0x%h,0x%h,%b), cpu=(0x%h,0x%h,%b) → out=(0x%h,0x%h,%b)",
                 $time, mode, 
                 manual_a, manual_b, manual_opcode,
                 cpu_a, cpu_b, cpu_opcode,
                 select_a, select_b, select_opcode);
    end
    */
    
endmodule