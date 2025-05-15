`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 16:35:18
// Design Name: 
// Module Name: top_10000_cnt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_10000_cnt (
    input clk,
    input rst,
    input [1:0] sw,

    output [7:0] fnd_data,
    output [3:0] fnd_com,
    output tick_gen

);

    wire w_clk_1;
    wire w_oclk, w_orst;
    wire [7:0] w_sec;
    wire [7:0] w_min;
    wire w_carry;

    sw_ctrl U_SW_CTRL (
        .sw (sw),
        .clk(clk),
        .rst(rst),

        .oclk(w_oclk),
        .orst(w_orst)
    );
    //1초: 50_000_000
    clk_div_1hz #(
        .F_CNT(2 - 1)
    ) U_CLK_1Hz (
        .clk(w_oclk),
        .rst(w_orst),

        .clk_1hz(w_clk_1)
    );

    sec_counter U_SEC_CNT (
        .clk_div(w_clk_1),
        .rst(w_orst),

        .sec  (w_sec),
        .carry(w_carry)
        //.tick_sec(tick_sec)
    );

    min_counter U_MIN_CNT (
        .clk  (w_clk_1),
        .rst  (w_orst),
        .carry(w_carry),

        .min(w_min)
    );

    tick_gen U_TICK_GEN (
        .clk_div_1hz(w_clk_1),
        .clk(clk),
        .rst(rst),

        .tick_gen(tick_gen)
    );


    fnd_ctrl U_FND0 (
        .clk(clk),
        .rst(rst),
        .min(w_min),
        .sec(w_sec),

        .fnd_data(fnd_data),
        .fnd_com (fnd_com)
    );
endmodule
