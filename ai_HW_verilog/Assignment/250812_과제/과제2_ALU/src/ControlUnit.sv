`timescale 1ns / 1ps

module ControlUnit (
    input logic clk,
    input logic rst,
    input logic lt,

    output logic RF_Src_Mux_Sel,
    output logic [2:0] r_addr_1,
    output logic [2:0] r_addr_2,
    output logic [2:0] wr_addr,
    output logic wr_en,
    output logic [1:0] opcode,
    output logic outport_en
);

    typedef enum {
        S0,
        S1,
        S2,
        S3,
        S4,
        S5,
        S6,
        S7,
        S8,
        S9,
        S10,
        S11,
        S12
    } state_e;

    state_e state, next_state;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    always_comb begin
        next_state = state;
        RF_Src_Mux_Sel = 0;
        r_addr_1 = 0;
        r_addr_2 = 0;
        wr_addr = 0;
        wr_en = 0;
        opcode = 0;
        outport_en = 0;
        case (state)
            S0: begin
                RF_Src_Mux_Sel = 1;
                r_addr_1 = 0;
                r_addr_2 = 0;
                wr_addr = 1;
                wr_en = 1;
                opcode = 0;
                outport_en = 0;

                next_state = S1;
            end
            S1: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 0;
                r_addr_2 = 0;
                wr_addr = 2;
                wr_en = 1;
                opcode = 0;
                outport_en = 0;

                next_state = S2;
            end
            S2: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 0;
                r_addr_2 = 0;
                wr_addr = 3;
                wr_en = 1;
                opcode = 0;
                outport_en = 0;

                next_state = S3;
            end
            S3: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 0;
                r_addr_2 = 0;
                wr_addr = 4;
                wr_en = 1;
                opcode = 0;
                outport_en = 0;

                next_state = S4;
            end
            S4: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 1;
                r_addr_2 = 1;
                wr_addr = 2;
                wr_en = 1;
                opcode = 0;
                outport_en = 0;

                next_state = S5;
            end
            S5: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 2;
                r_addr_2 = 1;
                wr_addr = 3;
                wr_en = 1;
                opcode = 0;
                outport_en = 0;

                next_state = S6;
            end
            S6: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 3;
                r_addr_2 = 1;
                wr_addr = 4;
                wr_en = 1;
                opcode = 1;
                outport_en = 0;

                next_state = S7;
            end
            S7: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 1;
                r_addr_2 = 2;
                wr_addr = 1;
                wr_en = 1;
                opcode = 3;
                outport_en = 0;

                next_state = S8;
            end
            S8: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 4;
                r_addr_2 = 2;
                wr_addr = 0;
                wr_en = 0;
                opcode = 0;
                outport_en = 0;

                if (lt) begin
                    next_state = S6;
                end else begin
                    next_state = S9;
                end
            end
            S9: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 4;
                r_addr_2 = 3;
                wr_addr = 4;
                wr_en = 1;
                opcode = 2;
                outport_en = 0;

                next_state = S10;
            end
            S10: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 2;
                r_addr_2 = 3;
                wr_addr = 4;
                wr_en = 1;
                opcode = 0;
                outport_en = 0;

                next_state = S11;
            end
            S11: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 2;
                r_addr_2 = 4;
                wr_addr = 0;
                wr_en = 0;
                opcode = 0;
                outport_en = 0;

                if (lt) begin
                    next_state = S4;
                end else begin
                    next_state = S12;
                end
            end
            S12: begin
                RF_Src_Mux_Sel = 0;
                r_addr_1 = 0;
                r_addr_2 = 0;
                wr_addr = 0;
                wr_en = 0;
                opcode = 0;
                outport_en = 0;

                next_state = S12;
            end
        endcase
    end
endmodule
