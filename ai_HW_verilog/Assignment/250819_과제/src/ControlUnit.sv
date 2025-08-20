`timescale 1ns / 1ps
`include "defines.sv"

module ControlUnit (
    input  logic [31:0] instrCode,
    output logic        regFileWe,
    output logic [ 3:0] aluControl,
    output logic        aluSrcMuxSel,
    output logic        busWe,
    output logic        RFWDSrcMuxSel,
    output logic        branch,
    output logic        LuAuFlag,
    output logic        LuAuSrcMuxSel,
    output logic        AuPCSrcMuxSel,
    output logic        JTypeFlag,
    output  logic        JFlag,
    output  logic        JLFlag
);
    wire  [6:0] opcode = instrCode[6:0];
    wire  [3:0] operator = {instrCode[30], instrCode[14:12]};
    logic [10:0] signals;
    assign {regFileWe, aluSrcMuxSel, busWe, RFWDSrcMuxSel, branch, LuAuFlag, LuAuSrcMuxSel, AuPCSrcMuxSel, JTypeFlag, JFlag, JLFlag} = signals;

    always_comb begin
        signals = 11'b0;
        case (opcode)
            //{regFileWe, aluSrcMuxSel, busWe, RFWDSrcMuxSel, branch, LuAuFlag, LuAuSrcMuxSel, AuPCSrcMuxSel, JTypeFlag, JFlag, JLFlag} = signals;
            `OP_TYPE_R:  signals = 11'b1_0_0_0_0_0_0_0_0_0_0;
            `OP_TYPE_S:  signals = 11'b0_1_1_0_0_0_0_0_0_0_0;
            `OP_TYPE_L:  signals = 11'b1_1_0_1_0_0_0_0_0_0_0;
            `OP_TYPE_I:  signals = 11'b1_1_0_0_0_0_0_0_0_0_0;
            `OP_TYPE_B:  signals = 11'b0_0_0_0_1_0_0_0_0_0_0;
            `OP_TYPE_LU: signals = 11'b1_1_0_0_0_1_1_0_0_0_0;
            `OP_TYPE_AU: signals = 11'b1_1_0_0_0_1_1_1_0_0_0;
            `OP_TYPE_J:  signals = 11'b1_1_0_0_0_0_0_0_1_1_0;
            `OP_TYPE_JL: signals = 11'b1_1_0_0_0_0_0_0_1_0_1;
        endcase
    end

    always_comb begin
        aluControl = 4'bx;
        case (opcode)
            `OP_TYPE_R:  aluControl = operator;
            `OP_TYPE_S:  aluControl = `ADD;
            `OP_TYPE_L:  aluControl = `ADD;
            `OP_TYPE_I: begin
                if (operator == 4'b1101) begin
                    aluControl = operator;
                end else begin
                    aluControl = {1'b0, operator[2:0]};
                end
            end
            `OP_TYPE_B:  aluControl = operator;
            `OP_TYPE_LU: aluControl = `SLL;
            `OP_TYPE_AU: aluControl = `SLL;
            `OP_TYPE_J: aluControl = 4'bz;
            `OP_TYPE_JL: aluControl = `ADD;
        endcase
    end
endmodule
