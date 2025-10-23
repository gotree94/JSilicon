`timescale 1ns / 1ps
`default_nettype none

module DECODER_tb;
    // 테스트벤치 신호 선언
    reg clock;
    reg reset;
    reg ena;
    reg [7:0] instr_in;
    wire [2:0] alu_opcode;
    wire [3:0] operand;
    wire reg_sel;
    wire alu_enable;
    wire write_enable;
    
    // 테스트 카운터
    integer test_count;
    integer pass_count;
    integer fail_count;
    
    // DECODER 모듈 인스턴스화
    DECODER uut (
        .clock(clock),
        .reset(reset),
        .ena(ena),
        .instr_in(instr_in),
        .alu_opcode(alu_opcode),
        .operand(operand),
        .reg_sel(reg_sel),
        .alu_enable(alu_enable),
        .write_enable(write_enable)
    );
    
    // 클럭 생성 (10ns 주기 = 100MHz)
    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end
    
    // 결과 검증 태스크
    task check_output;
        input [2:0] exp_opcode;
        input [3:0] exp_operand;
        input exp_reg_sel;
        input exp_alu_en;
        input exp_write_en;
        input [200*8:1] test_name;
        begin
            test_count = test_count + 1;
            @(posedge clock);
            #1;
            
            if (alu_opcode === exp_opcode && 
                operand === exp_operand &&
                reg_sel === exp_reg_sel &&
                alu_enable === exp_alu_en &&
                write_enable === exp_write_en) begin
                $display("[PASS] Test %0d: %0s", test_count, test_name);
                $display("       instr=0x%h, opcode=%b, operand=%h, reg_sel=%b, alu_en=%b, wr_en=%b",
                         instr_in, alu_opcode, operand, reg_sel, alu_enable, write_enable);
                pass_count = pass_count + 1;
            end else begin
                $display("[FAIL] Test %0d: %0s", test_count, test_name);
                $display("       instr=0x%h", instr_in);
                $display("       Expected: opcode=%b, operand=%h, reg_sel=%b, alu_en=%b, wr_en=%b",
                         exp_opcode, exp_operand, exp_reg_sel, exp_alu_en, exp_write_en);
                $display("       Got:      opcode=%b, operand=%h, reg_sel=%b, alu_en=%b, wr_en=%b",
                         alu_opcode, operand, reg_sel, alu_enable, write_enable);
                fail_count = fail_count + 1;
            end
        end
    endtask
    
    // 리셋 태스크
    task reset_dut;
        begin
            reset = 1'b1;
            ena = 1'b0;
            instr_in = 8'h00;
            repeat(2) @(posedge clock);
            reset = 1'b0;
            @(posedge clock);
        end
    endtask
    
    // 명령어 전송 태스크
    task send_instruction;
        input [7:0] instruction;
        begin
            @(posedge clock);
            instr_in = instruction;
            ena = 1'b1;
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
        instr_in = 8'h00;
        
        $display("========================================");
        $display("DECODER Testbench 시작");
        $display("========================================");
        
        // 리셋 테스트
        $display("\n----- 리셋 테스트 -----");
        reset_dut;
        #1;
        check_output(3'b000, 4'b0000, 1'b0, 1'b0, 1'b0, "리셋 후 모든 출력 0");
        
        // ENA 비활성화 테스트
        $display("\n----- ENA=0 테스트 -----");
        ena = 1'b0;
        instr_in = 8'b000_0_1111; // ADD 명령어지만 ena=0
        @(posedge clock);
        #1;
        check_output(3'b000, 4'b0000, 1'b0, 1'b0, 1'b0, "ENA=0: 모든 출력 0");
        
        // ADD 명령어 테스트 (opcode=000)
        $display("\n----- ADD 명령어 테스트 (opcode=000) -----");
        
        send_instruction(8'b000_0_0011); // ADD R0, 3
        check_output(3'b000, 4'b0011, 1'b0, 1'b1, 1'b1, "ADD R0, 3");
        
        send_instruction(8'b000_1_0101); // ADD R1, 5
        check_output(3'b000, 4'b0101, 1'b1, 1'b1, 1'b1, "ADD R1, 5");
        
        send_instruction(8'b000_0_1111); // ADD R0, 15
        check_output(3'b000, 4'b1111, 1'b0, 1'b1, 1'b1, "ADD R0, 15");
        
        // SUB 명령어 테스트 (opcode=001)
        $display("\n----- SUB 명령어 테스트 (opcode=001) -----");
        
        send_instruction(8'b001_0_0010); // SUB R0, 2
        check_output(3'b001, 4'b0010, 1'b0, 1'b1, 1'b1, "SUB R0, 2");
        
        send_instruction(8'b001_1_0111); // SUB R1, 7
        check_output(3'b001, 4'b0111, 1'b1, 1'b1, 1'b1, "SUB R1, 7");
        
        // MUL 명령어 테스트 (opcode=010)
        $display("\n----- MUL 명령어 테스트 (opcode=010) -----");
        
        send_instruction(8'b010_0_0100); // MUL R0, 4
        check_output(3'b010, 4'b0100, 1'b0, 1'b1, 1'b1, "MUL R0, 4");
        
        send_instruction(8'b010_1_0110); // MUL R1, 6
        check_output(3'b010, 4'b0110, 1'b1, 1'b1, 1'b1, "MUL R1, 6");
        
        // DIV 명령어 테스트 (opcode=011)
        $display("\n----- DIV 명령어 테스트 (opcode=011) -----");
        
        send_instruction(8'b011_0_0010); // DIV R0, 2
        check_output(3'b011, 4'b0010, 1'b0, 1'b1, 1'b1, "DIV R0, 2");
        
        send_instruction(8'b011_1_0011); // DIV R1, 3
        check_output(3'b011, 4'b0011, 1'b1, 1'b1, 1'b1, "DIV R1, 3");
        
        // MOD 명령어 테스트 (opcode=100)
        $display("\n----- MOD 명령어 테스트 (opcode=100) -----");
        
        send_instruction(8'b100_0_0101); // MOD R0, 5
        check_output(3'b100, 4'b0101, 1'b0, 1'b1, 1'b1, "MOD R0, 5");
        
        send_instruction(8'b100_1_1000); // MOD R1, 8
        check_output(3'b100, 4'b1000, 1'b1, 1'b1, 1'b1, "MOD R1, 8");
        
        // CMP 명령어 테스트 (opcode=101)
        $display("\n----- CMP 명령어 테스트 (opcode=101) -----");
        
        send_instruction(8'b101_0_0000); // CMP R0, 0
        check_output(3'b101, 4'b0000, 1'b0, 1'b1, 1'b0, "CMP R0, 0 (write_enable=0)");
        
        send_instruction(8'b101_1_1111); // CMP R1, 15
        check_output(3'b101, 4'b1111, 1'b1, 1'b1, 1'b0, "CMP R1, 15 (write_enable=0)");
        
        // 정의되지 않은 명령어 테스트 (opcode=110, 111)
        $display("\n----- 정의되지 않은 명령어 테스트 -----");
        
        send_instruction(8'b110_0_0001); // Undefined opcode
        check_output(3'b110, 4'b0001, 1'b0, 1'b0, 1'b0, "Undefined opcode=110");
        
        send_instruction(8'b111_1_1010); // Undefined opcode
        check_output(3'b111, 4'b1010, 1'b1, 1'b0, 1'b0, "Undefined opcode=111");
        
        // 경계값 테스트
        $display("\n----- 경계값 테스트 -----");
        
        send_instruction(8'b000_0_0000); // ADD R0, 0 (최소값)
        check_output(3'b000, 4'b0000, 1'b0, 1'b1, 1'b1, "ADD R0, 0 (최소 operand)");
        
        send_instruction(8'b000_1_1111); // ADD R1, 15 (최대값)
        check_output(3'b000, 4'b1111, 1'b1, 1'b1, 1'b1, "ADD R1, 15 (최대 operand)");
        
        // 연속 명령어 테스트
        $display("\n----- 연속 명령어 테스트 -----");
        
        send_instruction(8'b000_0_0001); // ADD R0, 1
        check_output(3'b000, 4'b0001, 1'b0, 1'b1, 1'b1, "연속 1: ADD R0, 1");
        
        send_instruction(8'b001_0_0001); // SUB R0, 1
        check_output(3'b001, 4'b0001, 1'b0, 1'b1, 1'b1, "연속 2: SUB R0, 1");
        
        send_instruction(8'b010_0_0010); // MUL R0, 2
        check_output(3'b010, 4'b0010, 1'b0, 1'b1, 1'b1, "연속 3: MUL R0, 2");
        
        // ENA 토글 테스트
        $display("\n----- ENA 토글 테스트 -----");
        
        send_instruction(8'b000_0_0101); // ADD R0, 5
        check_output(3'b000, 4'b0101, 1'b0, 1'b1, 1'b1, "ENA=1: ADD R0, 5");
        
        @(posedge clock);
        ena = 1'b0;
        instr_in = 8'b001_0_0011; // 명령어 변경
        @(posedge clock);
        #1;
        check_output(3'b000, 4'b0000, 1'b0, 1'b0, 1'b0, "ENA=0: 모든 출력 0");
        
        // 리셋 중간 테스트
        $display("\n----- 중간 리셋 테스트 -----");
        
        send_instruction(8'b010_1_1010); // MUL R1, 10
        @(posedge clock);
        
        reset = 1'b1;
        @(posedge clock);
        #1;
        check_output(3'b000, 4'b0000, 1'b0, 1'b0, 1'b0, "리셋 중: 모든 출력 0");
        
        reset = 1'b0;
        @(posedge clock);
        
        // 모든 opcode 순차 테스트
        $display("\n----- 모든 opcode 순차 테스트 -----");
        begin : opcode_loop
            integer i;
            for (i = 0; i < 8; i = i + 1) begin
                send_instruction({i[2:0], 1'b0, 4'b0001});
                @(posedge clock);
                #1;
                $display("  opcode=%b: alu_en=%b, wr_en=%b", 
                         i[2:0], alu_enable, write_enable);
            end
        end
        
        // 테스트 결과 요약
        #20;
        $display("\n========================================");
        $display("테스트 완료");
        $display("========================================");
        $display("총 테스트: %0d", test_count);
        $display("성공:      %0d", pass_count);
        $display("실패:      %0d", fail_count);
        if (test_count > 0) begin
            $display("성공률:    %0d%%", (pass_count * 100) / test_count);
        end
        $display("========================================");
        
        if (fail_count == 0) begin
            $display("모든 테스트 통과!");
        end else begin
            $display("일부 테스트 실패");
        end
        
        #10;
        $finish;
    end
    
    // 타임아웃 감시
    initial begin
        #10000;
        $display("\n[ERROR] 타임아웃! 테스트가 너무 오래 실행되었습니다.");
        $finish;
    end
    
    // 파형 덤프
    initial begin
        $dumpfile("decoder_tb.vcd");
        $dumpvars(0, DECODER_tb);
    end
    
endmodule