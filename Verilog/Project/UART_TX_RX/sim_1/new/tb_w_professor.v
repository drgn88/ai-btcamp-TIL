`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/23 11:00:02
// Design Name: 
// Module Name: tb_w_professor
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


module tb_w_professor ();
    reg  clk;
    reg  rst;
    reg  btn_start;
    reg rx_data;

    wire tx;
    wire tx_busy;
    wire tx_done;
    wire w_tick;
    wire [7:0] o_rx_dout;
    wire o_rx_done;

    UART_tx DUT_TX(
    .clk(clk),
    .rst(rst),
    .baud_tick(w_tick),
    .start(btn_start),
    .din(8'h30),

    .o_tx(tx),
    .o_tx_done(tx_done),
    .o_tx_busy(tx_busy)
);

uart_rx DUT_RX(
    .clk(clk),
    .rst(rst),
    .rx_data(rx_data),
    .baud_tick(w_tick),

    .o_dout(o_rx_dout),
    .o_rx_done(o_rx_done)
);

    baudrate DUT_BD(
    .clk(clk),
    .rst(rst),
    .baud_tick(w_tick)
);

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        #0;
        rst = 1; rx_data = 1;

        #10;
        rst = 0;

        #5;
        btn_start = 1;

        #5;
        btn_start = 0;

        rx_data = 0;        //START
        #104160;
        rx_data = 0;        //d0
        #104160;
        rx_data = 1;
        #104160;
        rx_data = 0;
        #104160;
        rx_data = 0;
        #104160;
        rx_data = 1;
        #104160;
        rx_data = 1;
        #104160;
        rx_data = 0;
        #104160;
        rx_data = 0;
        #104160;

        rx_data = 1;


        $stop;
    end
endmodule
