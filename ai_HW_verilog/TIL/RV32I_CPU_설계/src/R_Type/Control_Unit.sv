`timescale 1ns / 1ps

// Single Cycle Control Logic은 FSM이 아닌 Combination Logic
module Control_Unit (
    input logic [31:0] instr_code,

    output logic RF_wr_en,
    output logic [3:0] alu_ctrl
);

    logic [6:0] opcode;  //명령어 타입
    logic [3:0] operator;  //연산자 구분

    assign opcode   = instr_code[6:0];
    assign operator = {instr_code[30], instr_code[14:12]};

    always_comb begin
        RF_wr_en = 0;  //Latch 방지용
        case (opcode)
            7'b011_0011: RF_wr_en = 1;
        endcase
    end

    always_comb begin
        alu_ctrl = 2'bz;
        case (opcode)
            7'b011_0011: begin      //R-type
                alu_ctrl = 2'bz;
                case (operator)
                    4'b0000: alu_ctrl = 4'b0000;  //add
                    4'b1000: alu_ctrl = 4'b0001;  //sub
                    4'b0001: alu_ctrl = 4'b0010;  //sll
                    4'b0101: alu_ctrl = 4'b0011;  //srl
                    4'b1101: alu_ctrl = 4'b0100;  //sra
                    4'b0010: alu_ctrl = 4'b0101;  //slt
                    4'b0011: alu_ctrl = 4'b0110;  //sltu
                    4'b0100: alu_ctrl = 4'b0111;  //xor
                    4'b0110: alu_ctrl = 4'b1000;  //or
                    4'b0111: alu_ctrl = 4'b1001;  //and
                endcase
            end
        endcase
    end

endmodule
