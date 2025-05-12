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

    output [7:0] fnd_data,
    output [3:0] fnd_com
);

    wire [13:0] w_cnt;
    wire w_oclk;

    clk_divider_1hz U_CDV_0(
    .clk(clk),
    .rst(rst),
    .oclk(w_oclk)
    );


    cnt_10k U_CNT10k_0 (
        .clk(w_oclk),
        //.clk(clk),
        .rst(rst),

        .cnt(w_cnt)
    );


    fnd_ctrl U_FND0 (
        .clk(clk),
        .rst(rst),
        .cnt_data(w_cnt),
        .fnd_data(fnd_data),
        .fnd_com(fnd_com)
    );
endmodule
