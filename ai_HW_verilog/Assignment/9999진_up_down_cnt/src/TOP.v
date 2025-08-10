`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/06 10:52:19
// Design Name: 
// Module Name: TOP
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


module TOP(
    input clk,
    input rstn,
    input sw1,
    // input sw2,

    output [7:0] fnd_data,
    output [3:0] fnd_com
    );

    wire [3:0] w_time_1;
    wire [3:0] w_time_10;
    wire [3:0] w_time_100;
    wire [3:0] w_time_1000;

    TOP_cnt CNT_MOD(
    .clk(clk),
    .rstn(rstn),
    .sw1(sw1),
    // .sw2(sw2),

    .time_1(w_time_1),
    .time_10(w_time_10),
    .time_100(w_time_100),
    .time_1000(w_time_1000)
    );

    fnd_ctrl U_FND_CTRL(
    .clk(clk),
    .rstn(rstn),
    .time_1(w_time_1),
    .time_10(w_time_10),
    .time_100(w_time_100),
    .time_1000(w_time_1000),

    .fnd_data(fnd_data),
    .fnd_com(fnd_com)
    );
endmodule
