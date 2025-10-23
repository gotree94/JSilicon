`timescale 1ns / 1ps
`default_nettype none

module UART_TX_tb;
    // 테스트벤치 신호 선언
    reg clock;
    reg reset;
    reg start;
    reg [7:0] data_in;
    wire tx;
    wire busy;
    
    // UART 파라미터
    parameter CLOCK_DIV = 10; // 테스트를 위해 짧게 설정 (실제: 1250)
    parameter BIT_PERIOD = CLOCK_DIV * 10; // ns 단위
    
    // 테스트 카운터
    integer test_count;
    integer pass_count;
    integer fail_count;
    
    // 수신된 데이터 저장
    reg [7:0] received_data;
    reg [7:0] expected_data;
    
    // UART_TX 모듈 인스턴스화 (파라미터 오버라이드)
    UART_TX #(
        .CLOCK_DIV(CLOCK_DIV)
    ) uut (
        .clock(clock),
        .reset(reset),
        .start(start),
        .data_in(data_in),
        .tx(tx),
        .busy(busy)
    );
    
    // 클럭 생성 (10ns 주기 = 100MHz)
    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end
    
    // UART 프레임 수신 태스크
    //task receive_uart_byte;
    //    output [7:0] data_out;
    //    integer i;
    //    begin
    //        // START 비트 대기
    //        wait (tx == 1'b0);
    //        $display("  [RX] START 비트 감지 (@%0t)", $time);
    //        
    //        // START 비트 중간까지 대기
    //        #(BIT_PERIOD / 2);
    //        
    //        // START 비트 확인
    //        if (tx !== 1'b0) begin
    //            $display("  [ERROR] START 비트가 0이 아님!");
    //        end
    //        
    //        // START 비트 끝까지 대기
    //        #(BIT_PERIOD / 2);
    //        
    //        // 8 데이터 비트 수신 (LSB first)
    //        for (i = 0; i < 8; i = i + 1) begin
    //            #BIT_PERIOD;
    //            data_out[i] = tx;
    //            $display("  [RX] 비트 %0d: %b (@%0t)", i, tx, $time);
    //        end
    //        
    //        // STOP 비트 수신
    //        #BIT_PERIOD;
    //        if (tx !== 1'b1) begin
    //            $display("  [ERROR] STOP 비트가 1이 아님!");
    //        end else begin
    //            $display("  [RX] STOP 비트 감지 (@%0t)", $time);
    //        end
    //        
    //        $display("  [RX] 수신 완료: 0x%h (%b)", data_out, data_out);
    //    end
    //endtask
	
	task receive_uart_byte;
    output [7:0] data_out;
    integer i;
    begin
        // START 비트의 하강 감지
        wait (tx == 1'b0);
        $display("  [RX] START 비트 감지 (@%0t)", $time);

        // --- 핵심 수정 ---
        // START 비트 끝(경계)까지 이동: 반 주기
        #(BIT_PERIOD/2);
        // 여기서 tx가 여전히 0인지 확인(선택)
        if (tx !== 1'b0) $display("  [ERROR] START 비트가 0이 아님!");

        // START 비트 끝났고, 곧바로 data bit0가 시작됨.
        // bit0의 '중앙'으로 가려면 반 비트 더 이동
        #(BIT_PERIOD/2);

        // 이제 bit0 중앙에 위치. bit0 샘플링 후, 매 비트 주기마다 샘플링
        for (i = 0; i < 8; i = i + 1) begin
            data_out[i] = tx;
            $display("  [RX] 비트 %0d: %b (@%0t)", i, tx, $time);
            #BIT_PERIOD;
        end

        // STOP 비트는 현재 시점에서 '중앙'보다 약간 이른 위치임.
        // STOP의 중앙에서 확인하려면 반 비트 더 이동
        #(BIT_PERIOD/2);
        if (tx !== 1'b1) begin
            $display("  [ERROR] STOP 비트가 1이 아님!");
        end else begin
            $display("  [RX] STOP 비트 감지 (@%0t)", $time);
        end

        $display("  [RX] 수신 완료: 0x%h (%b)", data_out, data_out);
    end
	endtask
    
    // UART 전송 및 검증 태스크 (수정됨 - return 제거)
    task send_and_verify;
        input [7:0] test_data;
        input [200*8:1] test_name;
        reg test_passed;  // 테스트 통과 플래그 추가
        begin
            test_count = test_count + 1;
            expected_data = test_data;
            test_passed = 1'b1;  // 초기값: 통과
            
            $display("\n[TEST %0d] %0s", test_count, test_name);
            $display("  송신 데이터: 0x%h (%b)", test_data, test_data);
            
            // 데이터 전송 시작
            @(posedge clock);
            data_in = test_data;
            start = 1'b1;
            @(posedge clock);
            start = 1'b0;
            
            // busy 신호 확인
            @(posedge clock);
            #1;
            if (busy !== 1'b1) begin
                $display("  [FAIL] busy 신호가 1이 아님!");
                fail_count = fail_count + 1;
                test_passed = 1'b0;  // return 대신 플래그 설정
            end
            
            // 테스트 통과한 경우에만 UART 수신 진행
            if (test_passed) begin
                // UART 프레임 수신
                receive_uart_byte(received_data);
                
                // 결과 비교
                if (received_data === expected_data) begin
                    $display("  [PASS] 데이터 일치: 0x%h", received_data);
                    pass_count = pass_count + 1;
                end else begin
                    $display("  [FAIL] 데이터 불일치!");
                    $display("    예상: 0x%h (%b)", expected_data, expected_data);
                    $display("    수신: 0x%h (%b)", received_data, received_data);
                    fail_count = fail_count + 1;
                end
                
                // busy 신호 해제 대기
                wait (busy == 1'b0);
                $display("  전송 완료, busy=0 (@%0t)", $time);
            end
        end
    endtask
    
    // 리셋 태스크 (괄호 제거)
    task reset_dut;
        begin
            reset = 1'b1;
            start = 1'b0;
            data_in = 8'h00;
            repeat(3) @(posedge clock);
            reset = 1'b0;
            @(posedge clock);
        end
    endtask
    
    // 상태 모니터링 태스크
    task monitor_state;
        input [200*8:1] label;
        begin
            $display("%0s: state=%0d, tx=%b, busy=%b, clock_count=%0d, bit_idx=%0d",
                     label, uut.state, tx, busy, uut.clock_count, uut.bit_idx);
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
        start = 1'b0;
        data_in = 8'h00;
        received_data = 8'h00;
        
        $display("========================================");
        $display("UART_TX Testbench");
        $display("========================================");
        $display("파라미터:");
        $display("  CLOCK_DIV = %0d", CLOCK_DIV);
        $display("  Baud Rate = %.0f bps", 100_000_000.0 / CLOCK_DIV);
        $display("  Bit Period = %0d ns", BIT_PERIOD);
        $display("========================================");
        $display("UART 프레임 구조:");
        $display("  1 START bit (0)");
        $display("  8 DATA bits (LSB first)");
        $display("  1 STOP bit (1)");
        $display("========================================\n");
        
        // ===== 리셋 테스트 =====
        $display("----- 리셋 테스트 -----");
        reset_dut;  // 괄호 제거
        #1;
        
        test_count = test_count + 1;
        if (tx === 1'b1 && busy === 1'b0 && uut.state === 3'd0) begin
            $display("[PASS] 리셋 후: tx=1 (IDLE), busy=0, state=IDLE");
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] 리셋 후 상태 오류");
            $display("  tx=%b (예상: 1)", tx);
            $display("  busy=%b (예상: 0)", busy);
            $display("  state=%0d (예상: 0)", uut.state);
            fail_count = fail_count + 1;
        end
        
        // ===== IDLE 상태 테스트 =====
        $display("\n----- IDLE 상태 테스트 -----");
        
        test_count = test_count + 1;
        repeat(10) @(posedge clock);
        #1;
        if (tx === 1'b1 && busy === 1'b0) begin
            $display("[PASS] IDLE 상태 유지: tx=1, busy=0");
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] IDLE 상태 오류");
            fail_count = fail_count + 1;
        end
        
        // ===== 기본 전송 테스트 =====
        $display("\n----- 기본 전송 테스트 -----");
        
        send_and_verify(8'h00, "전송: 0x00 (모든 비트 0)");
        #(BIT_PERIOD * 2);
        
        send_and_verify(8'hFF, "전송: 0xFF (모든 비트 1)");
        #(BIT_PERIOD * 2);
        
        send_and_verify(8'h55, "전송: 0x55 (0101_0101)");
        #(BIT_PERIOD * 2);
        
        send_and_verify(8'hAA, "전송: 0xAA (1010_1010)");
        #(BIT_PERIOD * 2);
        
        // ===== ASCII 문자 전송 테스트 =====
        $display("\n----- ASCII 문자 전송 테스트 -----");
        
        send_and_verify(8'h41, "전송: 'A' (0x41)");
        #(BIT_PERIOD * 2);
        
        send_and_verify(8'h42, "전송: 'B' (0x42)");
        #(BIT_PERIOD * 2);
        
        send_and_verify(8'h30, "전송: '0' (0x30)");
        #(BIT_PERIOD * 2);
        
        // ===== 연속 전송 테스트 =====
        $display("\n----- 연속 전송 테스트 -----");
        
        begin : continuous_tx
            integer i;
            reg [7:0] tx_data;
            
            for (i = 0; i < 5; i = i + 1) begin
                tx_data = i + 8'h10;
                send_and_verify(tx_data, "연속 전송");
                #(BIT_PERIOD * 1);
            end
        end
        
        // ===== 경계값 테스트 =====
        $display("\n----- 경계값 테스트 -----");
        
        send_and_verify(8'h01, "전송: 0x01 (최소값+1)");
        #(BIT_PERIOD * 2);
        
        send_and_verify(8'hFE, "전송: 0xFE (최대값-1)");
        #(BIT_PERIOD * 2);
        
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
        #1000000;
        $display("\n[ERROR] 타임아웃! 테스트가 너무 오래 실행되었습니다.");
        $finish;
    end
    
    // 파형 덤프
    initial begin
        $dumpfile("uart_tx_tb.vcd");
        $dumpvars(0, UART_TX_tb);
    end
    
endmodule