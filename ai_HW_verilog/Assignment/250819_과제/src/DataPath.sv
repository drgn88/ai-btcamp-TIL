`timescale 1ns / 1ps
`include "defines.sv"

module DataPath (
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] instrCode,
    output logic [31:0] instrMemAddr,
    input  logic        regFileWe,
    input  logic [ 3:0] aluControl,
    input  logic        aluSrcMuxSel,
    output logic [31:0] busAddr,
    output logic [31:0] busWData,
    input  logic [31:0] busRData,
    input  logic        RFWDSrcMuxSel,
    input  logic        branch,
    input  logic        LuAuFlag,
    input  logic        LuAuSrcMuxSel,
    input  logic        AuPCSrcMuxSel,
    input  logic        JTypeFlag,
    input  logic        JFlag,
    input  logic        JLFlag
);

    logic [31:0] aluResult, RFData1, RFData2;
    logic [31:0] PCSrcData, PCOutData;
    logic [31:0]
        aluSrcMuxOut, immExt, RFWDSrcMuxOut, LuAuSrcMuxOut, AuJSrcMuxOut;
    logic [31:0] PC_4_AdderResult;
    logic [31:0] PC_Imm_AdderResult;
    logic [31:0] PC_Au_AdderResult;
    logic [31:0] PCSrcMuxOut;
    logic btaken;
    logic BType_Flag;

    assign instrMemAddr = PCOutData;
    assign busAddr = aluResult;
    assign busWData = RFData2;

    RegisterFile U_RegFile (
        .clk(clk),
        .we (regFileWe),
        .RA1(instrCode[19:15]),
        .RA2(instrCode[24:20]),
        .WA (instrCode[11:7]),
        .WD (AuJSrcMuxOut),
        .RD1(RFData1),
        .RD2(RFData2)
    );

    mux_2x1 U_AluSrcMux (
        .sel(aluSrcMuxSel),
        .x0 (RFData2),
        .x1 (immExt),
        .y  (aluSrcMuxOut)
    );

    mux_2x1 U_LuAUSrcMux (
        .sel(LuAuSrcMuxSel),
        .x0 (RFData1),
        .x1 (32'd12),
        .y  (LuAuSrcMuxOut)
    );

    mux_2x1 U_RFWDSrcMux (
        .sel(RFWDSrcMuxSel),
        .x0 (aluResult),
        .x1 (busRData),
        .y  (RFWDSrcMuxOut)
    );

    adder U_PC_AU_Adder (
        .a(RFWDSrcMuxOut),
        .b(PCOutData),
        .y(PC_Au_AdderResult)
    );

    AuJSrcMux U_AuJSrcMux (
        .AuPCSrcMuxsel(AuPCSrcMuxSel),
        .JTypeFlag(JTypeFlag),
        .RFWDSrcMuxOut(RFWDSrcMuxOut),
        .PC_Au_AdderResult(PC_Au_AdderResult),
        .PC_4_AdderResult(PC_4_AdderResult),
        .AuJSrcMuxOut(AuJSrcMuxOut)
    );


    alu U_ALU (
        .aluControl(aluControl),
        .LuAuFlag  (LuAuFlag),
        .a         (LuAuSrcMuxOut),
        .b         (aluSrcMuxOut),
        .result    (aluResult),
        .btaken    (btaken)
    );

    immExtend U_ImmExtend (
        .instrCode(instrCode),
        .immExt   (immExt)
    );

    adder U_PC_IMM_Adder (
        .a(immExt),
        .b(PCOutData),
        .y(PC_Imm_AdderResult)
    );

    adder U_PC_4_Adder (
        .a(32'd4),
        .b(PCOutData),
        .y(PC_4_AdderResult)
    );

    assign BType_Flag = (branch & btaken);

    PCSrcMux U_PCSrcMux (
        .BType_Flag(BType_Flag),
        .JFlag(JFlag),
        .JLFlag(JLFlag),
        .PC_Imm_AdderResult(PC_Imm_AdderResult),
        .PC_4_AdderResult(PC_4_AdderResult),
        .aluResult(aluResult),

        .PCSrcMuxOut(PCSrcMuxOut)
    );

    register U_PC (
        .clk  (clk),
        .reset(reset),
        .en   (1'b1),
        .d    (PCSrcMuxOut),
        .q    (PCOutData)
    );

endmodule

module alu (
    input logic [3:0] aluControl,
    input logic LuAuFlag,
    input logic [31:0] a,
    input logic [31:0] b,
    output logic [31:0] result,
    output logic btaken
);
    always_comb begin
        result = 32'bx;
        case (aluControl)
            `ADD:  result = a + b;
            `SUB:  result = a - b;
            `SLL: begin
                if (LuAuFlag) begin
                    result = b << a;
                end else begin
                    result = a << b;
                end
            end
            `SRL:  result = a >> b;
            `SRA:  result = $signed(a) >>> b;
            `SLT:  result = ($signed(a) < $signed(b)) ? 1 : 0;
            `SLTU: result = (a < b) ? 1 : 0;
            `XOR:  result = a ^ b;
            `OR:   result = a | b;
            `AND:  result = a & b;
        endcase
    end

    always_comb begin
        btaken = 1'b0;
        case (aluControl[2:0])
            `BEQ:  btaken = (a == b);
            `BNE:  btaken = (a != b);
            `BLT:  btaken = ($signed(a) < $signed(b));
            `BGE:  btaken = ($signed(a) >= $signed(b));
            `BLTU: btaken = (a < b);
            `BGEU: btaken = (a >= b);
        endcase
    end
endmodule

module RegisterFile (
    input  logic        clk,
    input  logic        we,
    input  logic [ 4:0] RA1,
    input  logic [ 4:0] RA2,
    input  logic [ 4:0] WA,
    input  logic [31:0] WD,
    output logic [31:0] RD1,
    output logic [31:0] RD2
);
    logic [31:0] mem[0:2**5-1];

    initial begin  // for simulation test
        for (int i = 0; i < 32; i++) begin
            mem[i] = 10 + i;
        end
    end

    always_ff @(posedge clk) begin
        if (we) mem[WA] <= WD;
    end

    assign RD1 = (RA1 != 0) ? mem[RA1] : 32'b0;
    assign RD2 = (RA2 != 0) ? mem[RA2] : 32'b0;
endmodule

module register (
    input  logic        clk,
    input  logic        reset,
    input  logic        en,
    input  logic [31:0] d,
    output logic [31:0] q
);
    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            q <= 0;
        end else begin
            if (en) q <= d;
        end
    end
endmodule

module adder (
    input  logic [31:0] a,
    input  logic [31:0] b,
    output logic [31:0] y
);
    assign y = a + b;
endmodule

module mux_2x1 (
    input  logic        sel,
    input  logic [31:0] x0,
    input  logic [31:0] x1,
    output logic [31:0] y
);
    always_comb begin
        y = 32'bx;
        case (sel)
            1'b0: y = x0;
            1'b1: y = x1;
        endcase
    end
endmodule

module AuJSrcMux (
    input logic AuPCSrcMuxsel,
    input logic JTypeFlag,
    input logic [31:0] RFWDSrcMuxOut,
    input logic [31:0] PC_Au_AdderResult,
    input logic [31:0] PC_4_AdderResult,
    output logic [31:0] AuJSrcMuxOut
);
    always_comb begin
        AuJSrcMuxOut = RFWDSrcMuxOut;
        case ({
            AuPCSrcMuxsel, JTypeFlag
        })
            2'b10: AuJSrcMuxOut = PC_Au_AdderResult;
            2'b01: AuJSrcMuxOut = PC_4_AdderResult;
        endcase
    end
endmodule

module PCSrcMux (
    input logic BType_Flag,
    input logic JFlag,
    input logic JLFlag,
    input logic [31:0] PC_Imm_AdderResult,
    input logic [31:0] PC_4_AdderResult,
    input logic [31:0] aluResult,

    output logic [31:0] PCSrcMuxOut
);

    always_comb begin
        PCSrcMuxOut = PC_4_AdderResult;
        case ({
            BType_Flag, JFlag, JLFlag
        })
            3'b100: PCSrcMuxOut = PC_Imm_AdderResult;
            3'b010: PCSrcMuxOut = PC_Imm_AdderResult;
            3'b001: PCSrcMuxOut = aluResult;
        endcase
    end

endmodule

module immExtend (
    input  logic [31:0] instrCode,
    output logic [31:0] immExt
);
    wire [6:0] opcode = instrCode[6:0];
    wire [2:0] func3 = instrCode[14:12];

    always_comb begin
        immExt = 32'bx;
        case (opcode)
            `OP_TYPE_R: immExt = 32'bx;  // R-Type
            `OP_TYPE_L: immExt = {{20{instrCode[31]}}, instrCode[31:20]};
            `OP_TYPE_I: begin
                case (func3)
                    3'b001:  immExt = {27'b0, instrCode[24:20]};  //SLLI
                    3'b011:  immExt = {20'b0, instrCode[31:20]};  //SRLI, SRAI
                    3'b101:  immExt = {27'b0, instrCode[24:20]};  //SLTIU
                    default: immExt = {{20{instrCode[31]}}, instrCode[31:20]};
                endcase
            end
            `OP_TYPE_S:
            immExt = {
                {20{instrCode[31]}}, instrCode[31:25], instrCode[11:7]
            };  // S-Type
            `OP_TYPE_B:
            immExt = {
                {20{instrCode[31]}},
                instrCode[7],
                instrCode[30:25],
                instrCode[11:8],
                1'b0
            };
            `OP_TYPE_LU: immExt = {instrCode[31:12], 12'b0};
            `OP_TYPE_AU: immExt = {instrCode[31:12], 12'b0};
            `OP_TYPE_J:
            immExt = {
                {12{instrCode[31]}},
                instrCode[19:12],
                instrCode[20],
                instrCode[30:21],
                1'b0
            };
            `OP_TYPE_JL: immExt = {{20{instrCode[31]}}, instrCode[31:20]};
        endcase
    end
endmodule
