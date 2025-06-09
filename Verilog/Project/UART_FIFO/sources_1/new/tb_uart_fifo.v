`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/28 09:19:15
// Design Name: 
// Module Name: tb_uart_fifo
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


module tb_uart_fifo(

    );

    reg clk, rst, push, pop;
    reg rx, btn_start;
    reg  [7:0] push_Data;

    wire [7:0] pop_data;
    wire full, empty;
    wire tx;

    uart_fifo DUT (
        .clk(clk),
        .rst(rst),
        .btn_start(btn_start),
        .rx(rx),

        .tx(tx)
    );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        #0;
        rst = 1;
        btn_start = 0;
        rx = 1;

        #20;
        rst = 0;
        rx = 0;

        #169235;
        rx = 1;

        #100;

        $stop;
    end
endmodule
