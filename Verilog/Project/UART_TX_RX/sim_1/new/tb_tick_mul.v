`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/22 14:47:09
// Design Name: 
// Module Name: tb_tick_mul
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


module tb_tick_mul ();

    reg  clk;
    reg  rst;
    wire w_baud_tick;
    wire w_div_tick;

    Baud_tick_gen #(.SYS_CLK(
        100
    ), .BAUD(
        10
    ), .BAUD_COUNT(
        100 / 10
    )) DUT0 (
        .clk(clk),
        .rst(rst),

        //output baud_tick
        .baud_tick(w_baud_tick)
    );


    tick_counter #(
        .DIV_CNT(8)
    ) DUT1 (
        .clk (clk),
        .rst (rst),
        .tick(w_baud_tick),

        .div_tick(w_div_tick)
    );

    initial begin
        clk = 1'b0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        #0; rst = 1;

        #5; rst = 0;

        #100;

        $stop;
    end
endmodule
