`timescale 1ns / 1ps

module Accumulate_Sum_0to10(
    input logic clk,
    input logic rst,
    
    output logic [7:0] out_acc_sum
    );

    logic ALe10;
    logic A_Mux_Sel;
    logic A_En;
    logic Acc_Mux_Sel;
    logic Acc_En;
    logic Out_Buf_En;

    logic [($clog2(10_000_000 - 1)-1):0] div_cnt;
    logic clk_10hz;

    always_ff @( posedge clk or posedge rst ) begin
        if(rst) begin
            div_cnt <= 0;
            clk_10hz <= 0;
        end
        else if(div_cnt == (10_000_000 - 1)) begin
            clk_10hz <= 1;
            div_cnt <= 0;
        end
        else begin
            clk_10hz <= 0;
            div_cnt <= div_cnt + 1;
        end

    end

    Control_Unit U_CONTROL_UNIT(
    .clk(clk),
    // .clk(clk_10hz),
    .rst(rst),
    .ALe10(ALe10),

    .A_Mux_Sel(A_Mux_Sel),
    .A_En(A_En),
    .Acc_Mux_Sel(Acc_Mux_Sel),
    .Acc_En(Acc_En),
    .Out_Buf_En(Out_Buf_En)
    );

    Data_Path U_DATA_PATH(
    .clk(clk),
    // .clk(clk_10hz),
    .rst(rst),
    .A_Mux_Sel(A_Mux_Sel),
    .A_En(A_En),
    .Acc_Mux_Sel(Acc_Mux_Sel),
    .Acc_En(Acc_En),
    .Out_Buf_En(Out_Buf_En),

    .ALe10(ALe10),
    .out_acc_sum(out_acc_sum)
    );

endmodule
