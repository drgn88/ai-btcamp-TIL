`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/28 16:25:26
// Design Name: 
// Module Name: top_sonic_fnd
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


module top_sonic_fnd (
    input clk,
    input rst,
    input btn_start,
    input echo,

    output trig,
    output [7:0] fnd_data,
    output [3:0] fnd_com,
    output led
);

    wire [9:0] w_distance;
    wire w_btn_rst;
    wire w_btn_start;

    btn_debouncer BTN_START (
        .clk  (clk),
        .rst  (rst),
        .i_btn(btn_start),

        .o_btn(w_btn_start)
    );

    sr04_ctrl U_SR04_CTRL (
        .clk  (clk),
        .rst  (rst),
        .start(w_btn_start),
        .echo (echo),

        .trig(trig),
        .distance(w_distance),
        .dist_done(led)  //수정필요
    );

    fnd_ctrl U_FND_CTRL (
        .clk(clk),
        .rst(rst),
        .cnt_data(w_distance),

        .fnd_data(fnd_data),
        .fnd_com (fnd_com)
    );
endmodule
