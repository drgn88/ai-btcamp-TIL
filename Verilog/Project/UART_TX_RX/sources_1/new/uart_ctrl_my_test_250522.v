`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/22 18:50:47
// Design Name: 
// Module Name: uart_ctrl_my_test_250522
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


module uart_ctrl_my_test_250522(
    input clk,
    input rst,
    input btn_start,

    output tx
    );

    wire w_baud_tick;
    wire w_btn;

    btn_debouncer U_BTN(
    .clk(clk),
    .rst(rst),
    .i_btn(btn_start),

    .o_btn(w_btn)
);

    Baud_tick_gen #(
    .SYS_CLK(100_000_000),
    .BAUD(9600),
    .BAUD_COUNT(100_000_000 / (9600))
) U_TICK_GEN(
    .clk(clk),
    .rst(rst),

    .baud_tick(w_baud_tick)
);

uart_tx_fix U_TX_FIX(
    .clk(clk),
    .rst(rst),
    .baud_tick(w_baud_tick),
    .trig(w_btn),
    .i_data(8'h30),

    .tx(tx)
);
endmodule
