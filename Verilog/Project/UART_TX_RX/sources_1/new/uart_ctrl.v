`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/22 11:24:23
// Design Name: 
// Module Name: uart_ctrl
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


module uart_ctrl #(
    parameter BAUD_RATE = 9600,
    parameter SYS_CLK = 100_000_000
)(
    input clk,
    input rst,
    input btn_trig,

    output o_tx_data
);

    wire w_baud_tick;
    wire w_btn_trig;

    btn_debouncer U_BTN_DEBOUNCE(
    .clk(clk),
    .rst(rst),
    .i_btn(btn_trig),

    .o_btn(w_btn_trig)
);


    Baud_tick_gen #(
        .SYS_CLK(SYS_CLK),
        .BAUD(BAUD_RATE),
        .BAUD_COUNT(SYS_CLK / BAUD_RATE)
    ) U_BAUD_TICK (
        .clk(clk),
        .rst(rst),

        //output baud_tick
        .baud_tick(w_baud_tick)
    );

    uart_tx U_TX_UART (
        .clk(clk),
        .rst(rst),
        .baud_tick(w_baud_tick),
        .start_trigger(w_btn_trig),
        .i_data(8'h30),

        //output reg tx_data
        .tx_data(o_tx_data)
    );
endmodule
