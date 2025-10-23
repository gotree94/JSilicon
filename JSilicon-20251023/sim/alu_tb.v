`timescale 1ns / 1ps
`default_nettype none

module ALU_tb;
    // 테스트벤치 신호 선언
    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] opcode;
    reg ena;
    wire [15:0] result;
    
    // 테스트 카운터
    integer test_count;
    integer pass_count;
    integer fail_count;
    
    // ALU 모듈 인스턴스화
    ALU uut (
        .a(a),
        .b(b),
        .opcode(opcode),
        .ena(ena),
        .result(result)
    );
    
    // 결과 검증 태스크
    task check_result;
        input [15:0] expected;
        input [127:0] test_name;
        begin
            test_count = test_count + 1;
            #1;
            if (result === expected) begin
                $display("[PASS] Test %0d: %0s", test_count, test_name);
                $display("       a=%h, b=%h, opcode=%b, result=%h (expected=%h)", 
                         a, b, opcode, result, expected);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Test %0d: %0s", test_count, test_name);
                $display("       a=%h, b=%h, opcode=%b, result=%h (expected=%h)", 
                         a, b, opcode, result, expected);
                fail_count = fail_count + 1;
            end
            #9;
        end
    endtask
    
    initial begin
        // 초기화
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        a = 8'h00;
        b = 8'h00;
        opcode = 3'b000;
        ena = 1'b0;
        
        $display("========================================");
        $display("ALU Testbench 시작");
        $display("========================================");
        
        #10;
        
        // ===== ena=0 테스트 =====
        $display("\n----- ena=0 테스트 -----");
        ena = 1'b0;
        a = 8'h0F;
        b = 8'h05;
        opcode = 3'b000;
        check_result(16'h0000, "ena=0: 출력은 0이어야 함");
        
        // ===== ena=1로 설정 (중요!) =====
        ena = 1'b1;
        
        // ===== 덧셈 테스트 (opcode=000) =====
        $display("\n----- 덧셈 테스트 -----");
        opcode = 3'b000;
        
        a = 8'h00; b = 8'h00;
        check_result(16'h0000, "덧셈: 0 + 0 = 0");
        
        a = 8'h0F; b = 8'h05;
        check_result(16'h0014, "덧셈: 15 + 5 = 20");
        
        a = 8'hFF; b = 8'h01;
        check_result(16'h0100, "덧셈: 255 + 1 = 256 (오버플로우)");
        
        a = 8'h7F; b = 8'h7F;
        check_result(16'h00FE, "덧셈: 127 + 127 = 254");
        
        // ===== 뺄셈 테스트 (opcode=001) =====
        $display("\n----- 뺄셈 테스트 -----");
        opcode = 3'b001;
        
        a = 8'h0A; b = 8'h05;
        check_result(16'h0005, "뺄셈: 10 - 5 = 5");
        
        a = 8'h05; b = 8'h0A;
        check_result(16'h00FB, "뺄셈: 5 - 10 = -5 (언더플로우)");
        
        a = 8'hFF; b = 8'hFF;
        check_result(16'h0000, "뺄셈: 255 - 255 = 0");
        
        // ===== 곱셈 테스트 (opcode=010) =====
        $display("\n----- 곱셈 테스트 -----");
        opcode = 3'b010;
        
        a = 8'h00; b = 8'h05;
        check_result(16'h0000, "곱셈: 0 * 5 = 0");
        
        a = 8'h05; b = 8'h06;
        check_result(16'h001E, "곱셈: 5 * 6 = 30");
        
        a = 8'h0F; b = 8'h10;
        check_result(16'h00F0, "곱셈: 15 * 16 = 240");
        
        a = 8'hFF; b = 8'hFF;
        check_result(16'hFE01, "곱셈: 255 * 255 = 65025");
        
        // ===== 나눗셈 테스트 (opcode=011) =====
        $display("\n----- 나눗셈 테스트 -----");
        opcode = 3'b011;
        
        a = 8'h0A; b = 8'h02;
        check_result(16'h0005, "나눗셈: 10 / 2 = 5");
        
        a = 8'h0F; b = 8'h04;
        check_result(16'h0003, "나눗셈: 15 / 4 = 3 (정수 나눗셈)");
        
        a = 8'h64; b = 8'h00;
        check_result(16'h0000, "나눗셈: 100 / 0 = 0 (0으로 나누기)");
        
        a = 8'hFF; b = 8'h01;
        check_result(16'h00FF, "나눗셈: 255 / 1 = 255");
        
        // ===== 나머지 테스트 (opcode=100) =====
        $display("\n----- 나머지 테스트 -----");
        opcode = 3'b100;
        
        a = 8'h0A; b = 8'h03;
        check_result(16'h0001, "나머지: 10 % 3 = 1");
        
        a = 8'h0F; b = 8'h04;
        check_result(16'h0003, "나머지: 15 % 4 = 3");
        
        a = 8'h64; b = 8'h00;
        check_result(16'h0000, "나머지: 100 % 0 = 0 (0으로 나누기)");
        
        a = 8'h08; b = 8'h04;
        check_result(16'h0000, "나머지: 8 % 4 = 0");
        
        // ===== 같음 비교 테스트 (opcode=101) =====
        $display("\n----- 같음 비교 테스트 -----");
        opcode = 3'b101;
        
        a = 8'h0A; b = 8'h0A;
        check_result(16'h0001, "같음: 10 == 10 = 1");
        
        a = 8'h0A; b = 8'h0B;
        check_result(16'h0000, "같음: 10 == 11 = 0");
        
        a = 8'hFF; b = 8'hFF;
        check_result(16'h0001, "같음: 255 == 255 = 1");
        
        // ===== 크기 비교 (>) 테스트 (opcode=110) =====
        $display("\n----- 크기 비교 (>) 테스트 -----");
        opcode = 3'b110;
        
        a = 8'h0B; b = 8'h0A;
        check_result(16'h0001, "크기: 11 > 10 = 1");
        
        a = 8'h0A; b = 8'h0B;
        check_result(16'h0000, "크기: 10 > 11 = 0");
        
        a = 8'h0A; b = 8'h0A;
        check_result(16'h0000, "크기: 10 > 10 = 0");
        
        // ===== 크기 비교 (<) 테스트 (opcode=111) =====
        $display("\n----- 크기 비교 (<) 테스트 -----");
        opcode = 3'b111;
        
        a = 8'h0A; b = 8'h0B;
        check_result(16'h0001, "크기: 10 < 11 = 1");
        
        a = 8'h0B; b = 8'h0A;
        check_result(16'h0000, "크기: 11 < 10 = 0");
        
        a = 8'h0A; b = 8'h0A;
        check_result(16'h0000, "크기: 10 < 10 = 0");
        
        // ===== 랜덤 테스트 =====
        $display("\n----- 랜덤 테스트 -----");
        repeat(10) begin
            a = $random;
            b = $random;
            opcode = $random % 8;
            #10;
            $display("랜덤: a=%h, b=%h, opcode=%b, result=%h", a, b, opcode, result);
        end
        
        // ===== 테스트 결과 요약 =====
        #10;
        $display("\n========================================");
        $display("테스트 완료");
        $display("========================================");
        $display("총 테스트: %0d", test_count);
        $display("성공: %0d", pass_count);
        $display("실패: %0d", fail_count);
        $display("성공률: %0d%%", (pass_count * 100) / test_count);
        $display("========================================");
        
        if (fail_count == 0) begin
            $display("✓ 모든 테스트 통과!");
        end else begin
            $display("✗ 일부 테스트 실패");
        end
        
        $finish;
    end
    
    // 파형 덤프 (선택사항)
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, ALU_tb);
    end
    
endmodule