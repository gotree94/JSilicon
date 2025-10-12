`timescale 1ns / 1ps
`default_nettype none

module FSM_tb;
    // 테스트벤치 신호 선언
    reg clock;
    reg reset;
    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] opcode;
    reg ena;
    reg alu_ena;
    wire [15:0] alu_result;
    wire uart_tx;
    wire uart_busy;
    
    // UART 파라미터 (테스트용)
    parameter CLOCK_DIV   = 10;
    parameter BIT_PERIOD  = CLOCK_DIV * 10;
    
    // 테스트 카운터
    integer test_count;
    integer pass_count;
    integer fail_count;
    
    // 수신 데이터
    reg [7:0] received_data;
    
    // DUT 인스턴스
    FSM uut (
        .clock(clock),
        .reset(reset),
        .a(a),
        .b(b),
        .opcode(opcode),
        .ena(ena),
        .alu_ena(alu_ena),
        .alu_result(alu_result),
        .uart_tx(uart_tx),
        .uart_busy(uart_busy)
    );
    
    // UART_TX 파라미터 오버라이드 (테스트용)
    defparam uut.uart_connect.CLOCK_DIV = CLOCK_DIV;
    
    // 클럭 생성 (10ns 주기 = 100MHz)
    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end
    
    // UART 바이트 수신 태스크
    task receive_uart_byte;
        output [7:0] data_out;
        integer i;
        begin
            // START 비트 대기
            wait (uart_tx == 1'b0);
            $display("    [UART RX] START 비트 감지 (@%0t)", $time);
            
            #(BIT_PERIOD / 2);
            if (uart_tx !== 1'b0) begin
                $display("    [ERROR] START 비트 오류!");
            end
            #(BIT_PERIOD / 2);
            
            // 8 데이터 비트 수신
            for (i = 0; i < 8; i = i + 1) begin
                #BIT_PERIOD;
                data_out[i] = uart_tx;
            end
            
            // STOP 비트
            #BIT_PERIOD;
            if (uart_tx !== 1'b1) begin
                $display("    [ERROR] STOP 비트 오류!");
            end else begin
                $display("    [UART RX] STOP 비트 감지");
            end
            
            $display("    [UART RX] 수신 완료: 0x%h", data_out);
        end
    endtask
    
    // 리셋 태스크
    task reset_dut;
        begin
            reset   = 1'b1;
            ena     = 1'b0;
            alu_ena = 1'b0;
            a       = 8'h00;
            b       = 8'h00;
            opcode  = 3'b000;
            repeat(3) @(posedge clock);
            reset = 1'b0;
            @(posedge clock);
        end
    endtask
    
    // ALU 연산 및 UART 전송 태스크
    task test_operation;
        input [7:0]  val_a;
        input [7:0]  val_b;
        input [2:0]  op;
        input [15:0] expected_alu;
        input [7:0]  expected_uart;
        input [200*8:1] test_name;
        begin : TEST_OP_BODY
            test_count = test_count + 1;
            
            $display("\n[TEST %0d] %0s", test_count, test_name);
            $display("  입력: a=0x%h, b=0x%h, opcode=%b", val_a, val_b, op);
            
            // 입력 설정
            @(posedge clock);
            a       = val_a;
            b       = val_b;
            opcode  = op;
            alu_ena = 1'b1;
            ena     = 1'b1;
            
            // ALU 결과 확인
            @(posedge clock);
            #1;
            if (alu_result === expected_alu) begin
                $display("  [PASS] ALU 결과: 0x%h", alu_result);
            end else begin
                $display("  [FAIL] ALU 결과 오류");
                $display("    예상: 0x%h, 실제: 0x%h", expected_alu, alu_result);
                fail_count = fail_count + 1;
                disable test_operation;   // Verilog-2001: 조기 종료
                // 또는: disable TEST_OP_BODY;
            end
            
            // UART 전송 대기 및 수신
            receive_uart_byte(received_data);
            
            // UART 수신 데이터 확인
            if (received_data === expected_uart) begin
                $display("  [PASS] UART 전송 성공: 0x%h", received_data);
                pass_count = pass_count + 1;
            end else begin
                $display("  [FAIL] UART 데이터 불일치");
                $display("    예상: 0x%h, 수신: 0x%h", expected_uart, received_data);
                fail_count = fail_count + 1;
                disable test_operation;   // Verilog-2001: 조기 종료
                // 또는: disable TEST_OP_BODY;
            end
            
            // busy 해제 대기
            wait (uart_busy == 1'b0);
            $display("  전송 완료 (@%0t)", $time);
            
            // ena 비활성화
            @(posedge clock);
            ena     = 1'b0;
            alu_ena = 1'b0;
            @(posedge clock);
        end
    endtask
    
    // 상태 모니터링 태스크
    task monitor_state;
        input [200*8:1] label;
        begin
            $display("%0s: state=%0d, start_uart=%b, uart_busy=%b, alu_result=0x%h",
                     label, uut.state, uut.start_uart, uart_busy, alu_result);
        end
    endtask
    
    // 메인 테스트 시퀀스
    initial begin
        // 초기화
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        clock      = 1'b0;
        reset      = 1'b0;
        ena        = 1'b0;
        alu_ena    = 1'b0;
        a          = 8'h00;
        b          = 8'h00;
        opcode     = 3'b000;
        
        $display("========================================");
        $display("FSM (ALU + UART_TX Integration) Testbench");
        $display("========================================");
        $display("파라미터:");
        $display("  CLOCK_DIV = %0d", CLOCK_DIV);
        $display("  Bit Period = %0d ns", BIT_PERIOD);
        $display("========================================");
        $display("FSM 상태:");
        $display("  INIT (0): 초기 상태, UART 전송 시작");
        $display("  SEND (1): UART busy 대기");
        $display("  WAIT (2): UART 전송 완료 대기");
        $display("========================================");
        $display("ALU Opcode:");
        $display("  000: ADD, 001: SUB, 010: MUL");
        $display("  011: DIV, 100: MOD, 101: CMP(==)");
        $display("  110: CMP(>), 111: CMP(<)");
        $display("========================================\n");
        
        // ===== 리셋 테스트 =====
        $display("----- 리셋 테스트 -----");
        reset_dut;   // () 제거
        
        #1;
        test_count = test_count + 1;
        if (uut.state === 2'd0 && uut.start_uart === 1'b0) begin
            $display("[PASS] 리셋 후: state=INIT, start_uart=0");
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] 리셋 후 상태 오류");
            $display("  state=%0d (예상: 0)", uut.state);
            $display("  start_uart=%b (예상: 0)", uut.start_uart);
            fail_count = fail_count + 1;
        end
        
        // ===== ENA=0 테스트 =====
        $display("\n----- ENA=0 테스트 -----");
        test_count = test_count + 1;
        a       = 8'h10;
        b       = 8'h20;
        opcode  = 3'b000;
        alu_ena = 1'b1;
        ena     = 1'b0;
        
        repeat(10) @(posedge clock);
        #1;
        if (uut.state === 2'd0 && uut.start_uart === 1'b0) begin
            $display("[PASS] ENA=0: 상태 변경 없음");
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] ENA=0: 상태가 변경됨");
            fail_count = fail_count + 1;
        end
        
        // ===== 산술 연산 테스트 =====
        $display("\n----- 산술 연산 테스트 -----");
        test_operation(8'h0A, 8'h05, 3'b000, 16'h000F, 8'h0F, "덧셈: 10 + 5 = 15");
        #(BIT_PERIOD * 2);
        test_operation(8'h14, 8'h0A, 3'b001, 16'h000A, 8'h0A, "뺄셈: 20 - 10 = 10");
        #(BIT_PERIOD * 2);
        test_operation(8'h05, 8'h06, 3'b010, 16'h001E, 8'h1E, "곱셈: 5 * 6 = 30");
        #(BIT_PERIOD * 2);
        test_operation(8'h14, 8'h05, 3'b011, 16'h0004, 8'h04, "나눗셈: 20 / 5 = 4");
        #(BIT_PERIOD * 2);
        test_operation(8'h0F, 8'h04, 3'b100, 16'h0003, 8'h03, "나머지: 15 % 4 = 3");
        #(BIT_PERIOD * 2);
        
        // ===== 비교 연산 테스트 =====
        $display("\n----- 비교 연산 테스트 -----");
        test_operation(8'h0A, 8'h0A, 3'b101, 16'h0001, 8'h01, "같음: 10 == 10 = 1");
        #(BIT_PERIOD * 2);
        test_operation(8'h0A, 8'h0B, 3'b101, 16'h0000, 8'h00, "같음: 10 == 11 = 0");
        #(BIT_PERIOD * 2);
        test_operation(8'h0B, 8'h0A, 3'b110, 16'h0001, 8'h01, "크기: 11 > 10 = 1");
        #(BIT_PERIOD * 2);
        test_operation(8'h0A, 8'h0B, 3'b111, 16'h0001, 8'h01, "크기: 10 < 11 = 1");
        #(BIT_PERIOD * 2);
        
        // ===== 0으로 나누기 테스트 =====
        $display("\n----- 0으로 나누기 테스트 -----");
        test_operation(8'h0A, 8'h00, 3'b011, 16'h0000, 8'h00, "나눗셈: 10 / 0 = 0");
        #(BIT_PERIOD * 2);
        test_operation(8'h0F, 8'h00, 3'b100, 16'h0000, 8'h00, "나머지: 15 % 0 = 0");
        #(BIT_PERIOD * 2);
        
        // ===== 16비트 결과 테스트 (하위 8비트만 전송) =====
        $display("\n----- 16비트 결과 테스트 -----");
        test_operation(8'hFF, 8'hFF, 3'b010, 16'hFE01, 8'h01, 
                      "곱셈: 255 * 255 = 65025 (0xFE01, 하위 8비트: 0x01)");
        #(BIT_PERIOD * 2);
        test_operation(8'h80, 8'h02, 3'b010, 16'h0100, 8'h00,
                      "곱셈: 128 * 2 = 256 (0x0100, 하위 8비트: 0x00)");
        #(BIT_PERIOD * 2);
        
        // ===== 연속 동작 테스트 =====
        $display("\n----- 연속 동작 테스트 -----");
        begin : continuous_ops
            integer i;
            reg [7:0]  test_a, test_b;
            reg [15:0] expected_result;
            for (i = 0; i < 5; i = i + 1) begin
                test_a = i + 1;
                test_b = i + 2;
                expected_result = test_a + test_b;
                test_operation(test_a, test_b, 3'b000, 
                               expected_result, expected_result[7:0],
                               "연속 덧셈");
                #(BIT_PERIOD * 1);
            end
        end
        
        // ===== FSM 상태 전이 테스트 =====
        $display("\n----- FSM 상태 전이 테스트 -----");
        reset_dut;   // () 제거
        
        @(posedge clock);
        a = 8'h12; b = 8'h34; opcode = 3'b000;
        alu_ena = 1'b1; ena = 1'b1;
        
        // INIT → SEND 전이 확인
        @(posedge clock);
        #1;
        monitor_state("After 1 cycle");
        if (uut.state === 2'd1 && uut.start_uart === 1'b1) begin
            $display("  [PASS] INIT → SEND 전이");
        end else begin
            $display("  [FAIL] INIT → SEND 전이 실패");
            fail_count = fail_count + 1;
        end
        
        // SEND → WAIT 전이 대기
        wait (uut.state == 2'd2);
        #1;
        monitor_state("WAIT state");
        if (uut.start_uart === 1'b0) begin
            $display("  [PASS] SEND → WAIT 전이");
        end else begin
            $display("  [FAIL] SEND → WAIT 전이 실패");
            fail_count = fail_count + 1;
        end
        
        // WAIT → INIT 전이 대기
        wait (uut.state == 2'd0);
        #1;
        monitor_state("Back to INIT");
        $display("  [PASS] WAIT → INIT 전이");
        pass_count = pass_count + 1;
        
        // UART 전송 완료 대기
        wait (uart_busy == 1'b0);
        ena = 1'b0; alu_ena = 1'b0;
        #(BIT_PERIOD * 2);
        
        // ===== 전송 중 리셋 테스트 =====
        $display("\n----- 전송 중 리셋 테스트 -----");
        test_count = test_count + 1;
        @(posedge clock);
        a = 8'h99; b = 8'h01; opcode = 3'b000;
        alu_ena = 1'b1; ena = 1'b1;
        
        // 전송 시작
        @(posedge clock);
        @(posedge clock);
        
        // 전송 중간에 리셋
        #(BIT_PERIOD * 3);
        $display("  전송 중간에 리셋 발생");
        reset = 1'b1;
        @(posedge clock);
        reset = 1'b0;
        
        #1;
        if (uut.state === 2'd0 && uut.start_uart === 1'b0) begin
            $display("[PASS] 리셋 후 INIT 상태 복귀");
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] 리셋 후 상태 오류");
            fail_count = fail_count + 1;
        end
        #(BIT_PERIOD * 5);
        
        // ===== ENA 토글 테스트 =====
        $display("\n----- ENA 토글 테스트 -----");
        test_count = test_count + 1;
        @(posedge clock);
        a = 8'h55; b = 8'hAA; opcode = 3'b000;
        alu_ena = 1'b1; ena = 1'b1;
        
        @(posedge clock);
        @(posedge clock);
        
        // 중간에 ena 비활성화
        ena = 1'b0;
        @(posedge clock);
        #1;
        if (uut.state === 2'd0) begin
            $display("[PASS] ENA=0: INIT 상태로 복귀");
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] ENA=0: 상태 오류 (state=%0d)", uut.state);
            fail_count = fail_count + 1;
        end
        #(BIT_PERIOD * 2);
        
        // ===== 경계값 테스트 =====
        $display("\n----- 경계값 테스트 -----");
        test_operation(8'h00, 8'h00, 3'b000, 16'h0000, 8'h00, "최소값: 0 + 0");
        #(BIT_PERIOD * 2);
        test_operation(8'hFF, 8'h01, 3'b000, 16'h0100, 8'h00, 
                      "오버플로우: 255 + 1 = 256");
        #(BIT_PERIOD * 2);
        test_operation(8'h00, 8'h01, 3'b001, 16'h00FF, 8'hFF,
                      "언더플로우: 0 - 1 = -1 (0xFF)");
        #(BIT_PERIOD * 2);
        
        // ===== 복잡한 시나리오 테스트 =====
        $display("\n----- 복잡한 시나리오 테스트 -----");
        begin : complex_scenario
            reg [7:0] scenario_results [0:3];
            $display("  시나리오: (5+3) * 2 / 4 = 4");
            
            // Step 1: 5 + 3 = 8
            test_operation(8'h05, 8'h03, 3'b000, 16'h0008, 8'h08, 
                          "Step 1: 5 + 3 = 8");
            scenario_results[0] = received_data;
            #(BIT_PERIOD * 1);
            
            // Step 2: 8 * 2 = 16
            test_operation(8'h08, 8'h02, 3'b010, 16'h0010, 8'h10,
                          "Step 2: 8 * 2 = 16");
            scenario_results[1] = received_data;
            #(BIT_PERIOD * 1);
            
            // Step 3: 16 / 4 = 4
            test_operation(8'h10, 8'h04, 3'b011, 16'h0004, 8'h04,
                          "Step 3: 16 / 4 = 4");
            scenario_results[2] = received_data;
            
            $display("\n  시나리오 결과:");
            $display("    Step 1: 0x%h", scenario_results[0]);
            $display("    Step 2: 0x%h", scenario_results[1]);
            $display("    Step 3: 0x%h", scenario_results[2]);
        end
        #(BIT_PERIOD * 2);
        
        // ===== 스트레스 테스트 =====
        $display("\n----- 스트레스 테스트 (10회 연속) -----");
        begin : stress_test
            integer k;
            reg [7:0] stress_a, stress_b;
            reg [2:0] stress_op;
            integer error_count;
            error_count = 0;
            
            for (k = 0; k < 10; k = k + 1) begin
                stress_a = $random;
                stress_b = $random;
                stress_op = $random % 5; // 0~4 (ADD, SUB, MUL, DIV, MOD)
                
                @(posedge clock);
                a = stress_a;
                b = stress_b;
                opcode = stress_op;
                alu_ena = 1'b1;
                ena = 1'b1;
                
                @(posedge clock);
                @(posedge clock);
                
                // UART 전송 완료 대기
                wait (uart_busy == 1'b0);
                
                $display("  스트레스 %2d: a=0x%h, b=0x%h, op=%b → result=0x%h",
                         k, stress_a, stress_b, stress_op, alu_result);
                
                ena = 1'b0;
                alu_ena = 1'b0;
                #(BIT_PERIOD * 1);
            end
            
            test_count = test_count + 1;
            pass_count = pass_count + 1;
            $display("[PASS] 스트레스 테스트 10회 완료");
        end
        
        // ===== 테스트 결과 요약 =====
        #(BIT_PERIOD * 5);
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
        
        #100;
        $finish;
    end
    
    // 타임아웃 감시
    initial begin
        #2000000;
        $display("\n[ERROR] 타임아웃! 테스트가 너무 오래 실행되었습니다.");
        $finish;
    end
    
    // 파형 덤프
    initial begin
        $dumpfile("fsm_tb.vcd");
        $dumpvars(0, FSM_tb);
    end
    
    // 디버깅용 실시간 모니터 (필요 시 활성화)
    /*
    always @(posedge clock) begin
        if (ena) begin
            $display("@%0t: state=%0d, start_uart=%b, busy=%b, alu_result=0x%h, tx=%b",
                     $time, uut.state, uut.start_uart, uart_busy, alu_result, uart_tx);
        end
    end
    */
    
endmodule
