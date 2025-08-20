`timescale 1ns / 1ps
`include "defines.sv"

module ControlUnit (
    input  logic [31:0] instrCode,
    output logic        regFileWe,
    output logic [ 3:0] aluControl,
    output logic        alu_src_mux_sel,
    output logic        busWe,
    output logic rf_wd_src_mux_sel,
    output logic [1:0] store_size
);
    wire [6:0] opcode = instrCode[6:0];
    wire [3:0] operator = {instrCode[30], instrCode[14:12]};
    logic [3:0] signals;
    logic I_TYPE_SHAMT_FLAG;

    assign {regFileWe, alu_src_mux_sel, busWe, rf_wd_src_mux_sel} = signals;
    assign I_TYPE_SHAMT_FLAG = ((instrCode[14:12] == 3'd1) || (instrCode[14:12] == 3'd5)) ? 1 : 0;
    assign store_size = operator[1:0];

    //Control Signals    
    always_comb begin
        signals = 4'b0;
        case (opcode)
            //{regFileWe, alu_src_mux_sel, busWe, rf_wd_src_mux_sel} = signals;
            `R_TYPE: signals = 4'b1_0_0_0;
            `S_TYPE: signals = 4'b0_1_1_0;
            `L_TYPE: signals = 4'b1_1_0_1;
            `I_TYPE: signals = 4'b1_1_0_0;
        endcase
    end

    //ALU Control Signal
    always_comb begin
        aluControl = 4'bx;
        case (opcode)
            `R_TYPE: aluControl = operator;
            `S_TYPE: aluControl = `ADD;
            `L_TYPE: aluControl = `ADD;
            `I_TYPE:begin
                if(I_TYPE_SHAMT_FLAG) begin
                    aluControl = operator;
                end
                else begin
                    aluControl = {1'b0, operator[2:0]};
                end
            end
        endcase
    end

endmodule
