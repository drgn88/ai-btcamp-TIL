`timescale 1ns / 1ps

module Control_Unit(
    input clk,
    input rst,
    input logic ALe10,

    output logic A_Mux_Sel,
    output logic A_En,
    output logic Acc_Mux_Sel,
    output logic Acc_En,
    output logic Out_Buf_En
    );

    typedef enum { 
        S0,
        S1,
        S2,
        S3,
        S4,
        S5
    } state_e;

    state_e state, next_state;

    always_ff @( posedge clk or posedge rst ) begin
        if(rst) begin
            state <= S0;
        end
        else begin
            state <= next_state;
        end
    end

    always_comb begin
        next_state = state;
        A_Mux_Sel = 0;
        A_En = 0;
        Acc_Mux_Sel = 0;
        Acc_En = 0;
        Out_Buf_En = 0;
        case (state)
           S0 : begin
            A_Mux_Sel = 0;
            A_En = 1;
            Acc_Mux_Sel = 0;
            Acc_En = 1;
            Out_Buf_En = 0;
            next_state = S1;
           end
           S1 : begin
            A_En = 0;
            Acc_En = 0;
            Out_Buf_En = 0;
            if(ALe10) begin
                next_state = S2;
            end
            else begin
                next_state = S5;
            end
           end
           S2 : begin
            A_Mux_Sel = 0;
            A_En = 0;
            Acc_Mux_Sel = 1;
            Acc_En = 1;
            Out_Buf_En = 0;
            next_state = S3;
           end
           S3 : begin
            // A_Mux_Sel = 1;
            A_En = 0;
            // Acc_Mux_Sel = 1;
            Acc_En = 0;
            Out_Buf_En = 1;
            next_state = S4;
           end
           S4 : begin
            A_Mux_Sel = 1;
            A_En = 1;
            // Acc_Mux_Sel = 1;
            Acc_En = 0;
            Out_Buf_En = 0;
            next_state = S1;
           end
           S5 : begin
            A_En = 0;
            Acc_En = 0;
            Out_Buf_En = 0;
            next_state = S5;
           end  
        endcase
    end
endmodule
