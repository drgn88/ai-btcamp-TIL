`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/22 10:29:07
// Design Name: 
// Module Name: tb_top
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


module tb_top ();

    reg clk;
    reg rst;
    reg start_trigger;
    reg [7:0] i_data;

    wire tx_data;
    wire tx_data_param;
    wire w_baud_tick;

    Baud_tick_gen #(
        .SYS_CLK(100),
        .BAUD(10),
        .BAUD_COUNT(100 / 10)
    ) DUT0 (
        .clk(clk),
        .rst(rst),

        //output baud_tick
        .baud_tick(w_baud_tick)
    );

    uart_tx DUT1 (
    .clk(clk),
    .rst(rst),
    .baud_tick(w_baud_tick),
    .start_trigger(start_trigger),
    .i_data(i_data),

    .tx_data(tx_data)
    );

    uart_tx_fix DUT_FIX(
    .clk(clk),
    .rst(rst),
    .baud_tick(w_baud_tick),
    .trig(start_trigger),
    .i_data(i_data),

    .tx(tx_data_param)
);

    initial begin
        clk = 1'b0;
        forever begin
            #2 clk = ~clk;
        end
    end

    initial begin
        #0;
        rst = 1; i_data = 8'h55; start_trigger = 0;

        #3;
        rst = 0;

        #2;
        start_trigger = 1;
        
        #1;
        start_trigger = 0;

        #100000;
    end
endmodule
