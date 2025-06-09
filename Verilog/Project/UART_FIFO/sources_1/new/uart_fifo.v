`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/27 17:13:09
// Design Name: 
// Module Name: uart_fifo
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


module uart_fifo (
    input clk,
    input rst,
    input btn_start,
    input rx,

    output tx
);

    //RX_FIFO
    wire w_rx_done;
    wire w_rx_empty;
    wire [7:0] w_rx_pop;

    //TX_FIFO
    wire w_tx_full;
    wire [7:0] w_tx_data;
    wire [7:0] w_tx_pop;
    wire w_tx_empty;

    //UART_CTRL
    wire w_tx_busy;
    wire [7:0] w_send_rx;

    fifo_ram U_RX_FIFO (
        .clk(clk),
        .rst(rst),
        .pop(~w_tx_full),
        .push(w_rx_done),
        .push_data(w_send_rx),

        .pop_data(w_rx_pop),
        .full(),
        .empty(w_rx_empty)
    );

    fifo_ram U_TX_FIFO (
        .clk(clk),
        .rst(rst),
        .pop(~w_tx_busy),
        .push(~w_rx_empty),
        .push_data(w_rx_pop),

        .pop_data(w_tx_pop),
        .full(w_tx_full),
        .empty(w_tx_empty)
    );

    uart_controller U_UART_CTRL (
        .clk(clk),
        .rst(rst),
        .btn_start(btn_start),
        .tx_start(~w_tx_empty),
        .tx_din(w_tx_pop),
        .rx(rx),

        .tx(tx),
        .tx_done(),
        .rx_done(w_rx_done),
        .tx_busy(w_tx_busy),
        .rx_data(w_send_rx)
    );
endmodule
