`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/06 10:41:03
// Design Name: 
// Module Name: TOP_cnt
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


module TOP_cnt(
    input clk,
    input rstn,
    input sw1,
    // input sw2,

    output [3:0] time_1,
    output [3:0] time_10,
    output [3:0] time_100,
    output [3:0] time_1000
    );

    wire w_up_mode, w_down_mode;
    wire w_up_tick;
    wire w_down_tick;

    wire [13:0] w_cnt;

    timer_cu TIME_CU(
    .clk(clk),
    .rstn(rstn),
    .sw1(sw1),
    // .sw2(sw2),

    .up_mode(w_up_mode),
    .down_mode(w_down_mode)
    );

    tick_gen_10hz UP_TICK(
    .clk(clk),
    .rstn((rstn & (w_up_mode))),

    .o_tick_10(w_up_tick)
    );

    tick_gen_10hz DOWN_TICK(
    .clk(clk),
    .rstn((rstn & (w_down_mode))),

    .o_tick_10(w_down_tick)
    );
    
    cnt_9999 CNT_9999(
    .clk(clk),
    .rstn(rstn),
    .up_tick(w_up_tick),
    .down_tick(w_down_tick),

    .cnt(w_cnt)
    );

    time_splitter T_SPLIT(
    .cnt(w_cnt),

    .time_1(time_1),
    .time_10(time_10),
    .time_100(time_100),
    .time_1000(time_1000)
    );
endmodule
