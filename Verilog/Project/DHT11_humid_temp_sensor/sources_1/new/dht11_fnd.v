`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/29 17:40:55
// Design Name: 
// Module Name: dht11_fnd
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


module dht11_fnd (
    input clk,
    input rst,
    input btn_start,
    inout data,

    output [2:0] led,
    output [7:0] fnd_data,
    output [3:0] fnd_com
);

    wire w_btn_start;
    wire w_tick;
    wire[7:0] w_rh_data, w_temp_data;

    btn_debouncer U_BTN_START (
        .clk  (clk),
        .rst  (rst),
        .i_btn(btn_start),

        .o_btn(w_btn_start)
    );

    tick_gen U_TICK_GEN (
        .clk(clk),
        .rst(rst),

        .o_tick(w_tick)
    );

    dht11_ctrl U_DHT11_CU (
        .clk(clk),
        .rst(rst),
        .i_tick(w_tick),
        .start(w_btn_start),

        .rh_data(w_rh_data), //
        .temp_data(w_temp_data), //
        .dht11_done(),
        .state_led(led),
        .dht11_valid(),     //check sum

        .dht11_io(data)
    );

    fnd_ctrl U_FND_CU(
    .clk(clk),
    .rst(rst),
    .rh_data(w_rh_data),
    .temp_data(w_temp_data),

    .fnd_data(fnd_data),
    .fnd_com(fnd_com)
);

endmodule
