`timescale 1ns / 1ps
`default_nettype none

module PC_tb;
    // 신호 선언
    reg        clock;
    reg        reset;
    reg        ena;
    wire [7:0] instr_out;

    // 내부 PC 디버그용
    wire [3:0] pc_internal;

    // 카운터
    integer test_count;
    integer pass_count;
    integer fail_count;

    // DUT
    PC uut (
        .clock(clock),
        .reset(reset),
        .ena(ena),
        .instr_out(instr_out)
    );

    // 내부 신호 접근
    assign pc_internal = uut.pc;

    // 클럭: 100MHz (10ns)
    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end

    // ---------- 공통 메시지 ----------
    task pass_msg;
        input [200*8:1] name;
        begin
            $display("[PASS] Test %0d: %0s", test_count, name);
            pass_count = pass_count + 1;
        end
    endtask

    task fail_msg;
        input [200*8:1] name;
        begin
            $display("[FAIL] Test %0d: %0s", test_count, name);
            fail_count = fail_count + 1;
        end
    endtask

    // ---------- 즉시(현재 시점) 검사 ----------
    task check_now_instr;
        input [3:0]       expected_pc;
        input [7:0]       expected_instr;
        input [200*8:1]   test_name;
        begin
            test_count = test_count + 1;
            #1; // 소폭 전파 지연 대기
            if (pc_internal === expected_pc && instr_out === expected_instr) begin
                $display("       PC=%0d, instr=0x%h (%b)", pc_internal, instr_out, instr_out);
                pass_msg(test_name);
            end else begin
                $display("       Expected: PC=%0d, instr=0x%h", expected_pc, expected_instr);
                $display("       Got:      PC=%0d, instr=0x%h", pc_internal, instr_out);
                fail_msg(test_name);
            end
        end
    endtask

    task check_now_pc;
        input [3:0]       expected_pc;
        input [200*8:1]   test_name;
        begin
            test_count = test_count + 1;
            #1;
            if (pc_internal === expected_pc) begin
                $display("       PC=%0d, instr=0x%h", pc_internal, instr_out);
                pass_msg(test_name);
            end else begin
                $display("       Expected PC=%0d, Got PC=%0d", expected_pc, pc_internal);
                fail_msg(test_name);
            end
        end
    endtask

    // ---------- 한 사이클 진행 후 검사 ----------
    task step_and_check_instr;
        input [3:0]       expected_pc;
        input [7:0]       expected_instr;
        input [200*8:1]   test_name;
        begin
            @(posedge clock);
            check_now_instr(expected_pc, expected_instr, test_name);
        end
    endtask

    // ---------- 리셋 ----------
    task reset_dut;
        begin
            reset = 1'b1;
            ena   = 1'b0;
            repeat(2) @(posedge clock);
            reset = 1'b0;
            @(posedge clock);
        end
    endtask

    // ---------- ROM 덤프 ----------
    task display_rom;
        integer j;
        begin
            $display("\n===== ROM 내용 =====");
            for (j = 0; j < 16; j = j + 1) begin
                $display("ROM[%2d] = 0x%h (%b)", j, uut.rom[j], uut.rom[j]);
            end
            $display("====================\n");
        end
    endtask

    // ---------- 디코딩(디버그용) ----------
    task decode_instruction;
        input [7:0] instruction;
        reg   [2:0] opcode;
        reg   [4:0] operand;
        begin
            opcode  = instruction[7:5];
            operand = instruction[4:0];

            $write("  → 디코딩: ");
            case (opcode)
                3'b000: $write("ADD");
                3'b001: $write("SUB");
                3'b010: $write("MUL");
                3'b011: $write("DIV");
                3'b100: $write("MOD");
                3'b101: $write("CMP");
                default: $write("NOP/UNDEF");
            endcase
            $display(" %0d (opcode=%b, operand=%b)", operand, opcode, operand);
        end
    endtask

    // ---------- 메인 테스트 ----------
    initial begin
        // 초기화
        test_count = 0;
        pass_count = 0;
        fail_count = 0;
        clock = 1'b0;
        reset = 1'b0;
        ena   = 1'b0;

        $display("========================================");
        $display("PC (Program Counter + ROM) Testbench");
        $display("========================================");

        // ROM 확인
        #1;
        display_rom;

        // 리셋 테스트
        $display("\n----- 리셋 테스트 -----");
        reset_dut;
        check_now_pc(4'd0, "리셋 후 PC=0");

        // ENA=0 유지 테스트
        $display("\n----- ENA=0 테스트 -----");
        ena = 1'b0;
        repeat(5) begin
            @(posedge clock);
            check_now_pc(4'd0, "ENA=0: PC 유지");
        end

        // 정상 실행 테스트 (타이밍 정렬)
        $display("\n----- 정상 프로그램 실행 테스트 -----");
        ena = 1'b1;

        // posedge 이전 즉시 체크: PC=0, instr=ROM[0]
        check_now_instr(4'd0, 8'b00000011, "Cycle 0: ADD 3");
        decode_instruction(instr_out);

        // 이후는 한 사이클 진행 후 검사
        step_and_check_instr(4'd1, 8'b00100010, "Cycle 1: SUB 2");
        decode_instruction(instr_out);

        step_and_check_instr(4'd2, 8'b01000101, "Cycle 2: MUL 5");
        decode_instruction(instr_out);

        step_and_check_instr(4'd3, 8'b00000000, "Cycle 3: NOP");
        decode_instruction(instr_out);

        // 루프백 테스트
        $display("\n----- 루프백 테스트 (PC=3 → PC=0) -----");
        step_and_check_instr(4'd0, 8'b00000011, "루프백: PC=0, ADD 3");
        decode_instruction(instr_out);

        // 연속 루프 테스트 (2회)
        $display("\n----- 연속 루프 테스트 (2회 반복) -----");
        begin : loop_test
            integer k;
            reg [7:0] expected_instructions [0:3];
            expected_instructions[0] = 8'b00000011; // ADD 3
            expected_instructions[1] = 8'b00100010; // SUB 2
            expected_instructions[2] = 8'b01000101; // MUL 5
            expected_instructions[3] = 8'b00000000; // NOP
            for (k = 0; k < 8; k = k + 1) begin
                @(posedge clock);
                #1;
                if (instr_out === expected_instructions[pc_internal]) begin
                    $display("[PASS] 루프 %0d: PC=%0d, instr=0x%h", k/4, pc_internal, instr_out);
                    pass_count = pass_count + 1;
                end else begin
                    $display("[FAIL] 루프 %0d: PC=%0d, 예상=0x%h, 실제=0x%h",
                             k/4, pc_internal, expected_instructions[pc_internal], instr_out);
                    fail_count = fail_count + 1;
                end
                test_count = test_count + 1;
            end
        end

        // 중간 리셋 테스트 (레이스 방지 시퀀스)
        $display("\n----- 중간 리셋 테스트 -----");
        ena = 1'b0;                 // 고정
        @(posedge clock); #1;
        $display("리셋 전: PC=%0d", pc_internal);

        reset = 1'b1; #1;           // 비동기 리셋: 즉시 0
        check_now_pc(4'd0, "리셋 assert 즉시: PC=0");

        @(posedge clock); #1;       // 최소 1사이클 유지
        check_now_pc(4'd0, "리셋 유지: posedge 후에도 PC=0");

        reset = 1'b0; #1;           // 리셋 해제
        @(posedge clock); #1;       // 첫 posedge에서도 ena=0 이므로 유지
        check_now_pc(4'd0, "리셋 해제 후 첫 posedge: PC=0");

        ena = 1'b1;                 // 이제 재개
        @(posedge clock); #1;
        check_now_pc(4'd1, "리셋 후 재개: PC=1");

        // ENA 토글 테스트
        $display("\n----- ENA 토글 테스트 -----");
        reset_dut;                  // 기준 상태
        ena = 1'b0; #1;
        check_now_pc(4'd0, "기준: 리셋 후 PC=0");

        ena = 1'b1; @(posedge clock); #1; check_now_pc(4'd1, "ENA=1: PC=1");
        ena = 1'b0; @(posedge clock); #1; check_now_pc(4'd1, "ENA=0: 유지1");
                   @(posedge clock); #1; check_now_pc(4'd1, "ENA=0: 유지2");
        ena = 1'b1; @(posedge clock); #1; check_now_pc(4'd2, "ENA=1: PC=2");
                   @(posedge clock); #1; check_now_pc(4'd3, "ENA=1: PC=3");
                   @(posedge clock); #1; check_now_pc(4'd0, "ENA=1: wrap PC=0");

        // 타이밍 테스트 (직전/직후 위상 고정: negedge → posedge)
        $display("\n----- 타이밍 테스트 -----");
        reset_dut;
        ena = 1'b0;                 // 기준 위상 고정용
        @(negedge clock); #1;       // posedge 직전 위상 확보
        ena = 1'b1;                 // 직전 위상에서 ENA 활성
        check_now_pc(4'd0, "타이밍: posedge 직전 PC=0");
        @(posedge clock); #1;       // posedge 직후
        check_now_pc(4'd1, "타이밍: posedge 직후 PC=1");

        // 장시간 실행 테스트 (100 사이클)
        $display("\n----- 장시간 실행 테스트 (100 사이클) -----");
        reset_dut;
        ena = 1'b0; #1;
        check_now_pc(4'd0, "장시간: 시작 PC=0 (ENA=0)");

        ena = 1'b1;
        begin : long_run
            integer cycle;
            integer error_count;
            error_count = 0;

            for (cycle = 1; cycle <= 100; cycle = cycle + 1) begin
                @(posedge clock); #1;
                if (pc_internal !== (cycle % 4)) begin
                    $display("[ERROR] Cycle %0d: PC=%0d (예상=%0d)", cycle, pc_internal, (cycle % 4));
                    error_count = error_count + 1;
                end
            end

            test_count = test_count + 1;
            if (error_count == 0) begin
                $display("[PASS] 100 사이클 동안 정상 동작");
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] 100 사이클 중 %0d개 오류 발생", error_count);
                fail_count = fail_count + 1;
            end
        end

        // ROM 무결성
        $display("\n----- ROM 무결성 테스트 -----");
        test_count = test_count + 1;
        if (uut.rom[0] === 8'b00000011 &&
            uut.rom[1] === 8'b00100010 &&
            uut.rom[2] === 8'b01000101 &&
            uut.rom[3] === 8'b00000000) begin
            $display("[PASS] ROM 내용 유지됨");
            pass_count = pass_count + 1;
        end else begin
            $display("[FAIL] ROM 내용이 변경됨!");
            $display("  ROM[0]=0x%h (예상: 0x03)", uut.rom[0]);
            $display("  ROM[1]=0x%h (예상: 0x22)", uut.rom[1]);
            $display("  ROM[2]=0x%h (예상: 0x45)", uut.rom[2]);
            $display("  ROM[3]=0x%h (예상: 0x00)", uut.rom[3]);
            fail_count = fail_count + 1;
        end

        // 통계
        $display("\n----- 실행 통계 -----");
        display_rom;
        $display("프로그램 구성:");
        $display("  - ROM[0]: ADD 3 (0x03)");
        $display("  - ROM[1]: SUB 2 (0x22)");
        $display("  - ROM[2]: MUL 5 (0x45)");
        $display("  - ROM[3]: NOP   (0x00)");
        $display("  - ROM[4~15]: NOP (0x00)");
        $display("프로그램 길이: 4 명령어");
        $display("루프 주기: 4 클럭 사이클");

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

        if (fail_count == 0) $display("✓ 모든 테스트 통과!");
        else                 $display("✗ 일부 테스트 실패");

        #10;
        $finish;
    end

    // 타임아웃
    initial begin
        #50000;
        $display("\n[ERROR] 타임아웃! 테스트가 너무 오래 실행되었습니다.");
        $finish;
    end

    // 파형 덤프
    initial begin
        $dumpfile("pc_tb.vcd");
        $dumpvars(0, PC_tb);
        $dumpvars(1, uut.rom[0]);
        $dumpvars(1, uut.rom[1]);
        $dumpvars(1, uut.rom[2]);
        $dumpvars(1, uut.rom[3]);
    end
endmodule
