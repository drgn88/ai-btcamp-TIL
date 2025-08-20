`timescale 1ns / 1ps
`include "defines.sv"

module DataPath (
    input  logic        clk,
    input  logic        reset,
    input  logic [31:0] instrCode,
    output logic [31:0] instrMemAddr,
    input  logic        regFileWe,
    input  logic [ 3:0] aluControl,
    input  logic        alu_src_mux_sel,
    input  logic        rf_wd_src_mux_sel,
    output logic [31:0] busAddr,
    output logic [31:0] busWData,
    input  logic [31:0] busRData
);

    logic [31:0] aluResult, RFData1, RFData2;
    logic [31:0] PCSrcData, PCOutData;


    logic [31:0] imm_ext;
    logic [31:0] alu_src_mux_out;
    logic [31:0] wd_src_mux_out;

    assign instrMemAddr = PCOutData;
    assign busAddr = aluResult;
    assign busWData = RFData2;

    RegisterFile U_RegFile (
        .clk(clk),
        .we (regFileWe),
        .RA1(instrCode[19:15]),
        .RA2(instrCode[24:20]),
        .WA (instrCode[11:7]),
        .WD (wd_src_mux_out),
        .RD1(RFData1),
        .RD2(RFData2)
    );

    imm_extend U_IMM_EXTEND (
        .instr_code(instrCode),

        .imm_ext(imm_ext)
    );

    mux_2x1 U_ALU_SRC_MUX (
        .sel(alu_src_mux_sel),
        .x0 (RFData2),
        .x1 (imm_ext),

        .y(alu_src_mux_out)
    );

    alu U_ALU (
        .aluControl(aluControl),
        .a         (RFData1),
        .b         (alu_src_mux_out),
        .result    (aluResult)
    );

    mux_2x1 U_RFWD_SRC_MUX (
        .sel(rf_wd_src_mux_sel),
        .x0 (aluResult),
        .x1 (busRData),

        .y(wd_src_mux_out)
    );

    register U_PC (
        .clk  (clk),
        .reset(reset),
        .en   (1'b1),
        .d    (PCSrcData),
        .q    (PCOutData)
    );

    adder U_PC_Adder (
        .a(32'd4),
        .b(PCOutData),
        .y(PCSrcData)
    );
endmodule

module alu (
    input  logic [ 3:0] aluControl,
    input  logic [31:0] a,
    input  logic [31:0] b,
    output logic [31:0] result
);
    always_comb begin
        result = 32'bx;
        case (aluControl)
            `ADD:  result = a + b;
            `SUB:  result = a - b;
            `SLL:  result = a << b;
            `SRL:  result = a >> b;
            `SRA:  result = $signed(a) >>> b;
            `SLT:  result = ($signed(a) < $signed(b)) ? 1 : 0;
            `SLTU: result = (a < b) ? 1 : 0;
            `XOR:  result = a ^ b;
            `OR:   result = a | b;
            `AND:  result = a & b;
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
        mem[28] = 32'b1111_0000_0000_0000_0000_0000_0000_0000;
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
    input logic sel,
    input logic [31:0] x0,
    input logic [31:0] x1,

    output logic [31:0] y
);

    assign y = (!sel) ? x0 : x1;

endmodule

module imm_extend (
    input logic [31:0] instr_code,

    output logic [31:0] imm_ext
);

    logic [6:0] opcode;
    logic I_TYPE_SHAMT_FLAG;

    assign opcode = instr_code[6:0];
    assign I_TYPE_SHAMT_FLAG = ((instr_code[14:12] == 3'd1) || (instr_code[14:12] == 3'd5)) ? 1 : 0;

    always_comb begin
        imm_ext = 32'bz;  //Prevent Latch
        case (opcode)
            `R_TYPE: imm_ext = 32'bz;
            `S_TYPE:
            imm_ext = {
                {20{instr_code[31]}},
                instr_code[31:25],
                instr_code[11:7]  // Sign Extension
            };
            `L_TYPE: imm_ext = {{20{instr_code[31]}}, instr_code[31:20]};
            `I_TYPE: begin
                if(I_TYPE_SHAMT_FLAG) begin
                    imm_ext = {{27{1'b0}}, instr_code[24:20]};
                end
                else begin
                    imm_ext = {{20{instr_code[31]}}, instr_code[31:20]};     
                end
            end
        endcase
    end

endmodule
