`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/21 16:50:43
// Design Name: 
// Module Name: tb_baud_gen
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


module tb_baud_gen ();

    reg clk, rst;
    wire baud_tick_assign;
    wire baud_tick_always;

    baud_tick_assign #(
        .SYS_CLK(100),
        .BAUD(10),
        .BAUD_COUNT(100 / 10)
    ) DUT_ASSIGN (
        .clk(clk),
        .rst(rst),

        .baud_tick(baud_tick_assign)
    );

    baud_tick_always #(
        .SYS_CLK(100),
        .BAUD(10),
        .BAUD_COUNT(100 / 10)
    ) DUT_ALWAYS (
        .clk(clk),
        .rst(rst),

        .baud_tick(baud_tick_always)
    );

    initial begin
        clk = 1'b0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        #0;
        rst = 1;

        #3;
        rst = 0;

        #100000000;

        $stop;
    end
endmodule
