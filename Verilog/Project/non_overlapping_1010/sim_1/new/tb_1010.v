`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/15 12:37:10
// Design Name: 
// Module Name: tb_1010
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


module tb_1010(

    );
    reg clk, rst, x_moore, x_mealy;
    wire z_moore, z_mealy;

    non_overlap_1010_mealy dut_MEALY (
        .clk(clk),
        .rst(rst),
        .din(x_mealy),
        .dout(z_mealy)
    );

    non_overlap_1010_moore dut_MOORE (
        .clk(clk),
        .rst(rst),
        .din(x_moore),
        .dout(z_moore)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        x_mealy   = 0;
        x_moore   = 0;
        #10 rst = 1;
        #10 rst = 0;

        #10 x_mealy = 1; x_moore = 1;
        #10 x_mealy = 1; x_moore = 1;
        #10 x_mealy = 0; x_moore = 0;
        #10 x_mealy = 1; x_moore = 1;
        #10 x_mealy = 0; x_moore = 0;
        #10 x_mealy = 1; x_moore = 1;
        #10 x_mealy = 0; x_moore = 0;
        #10 x_mealy = 1; x_moore = 1;
        #10 x_mealy = 1; x_moore = 1;
        #10 x_mealy = 1; x_moore = 1;
        #10 x_mealy = 0; x_moore = 0;
        #10 x_mealy = 1; x_moore = 1;
        #10 x_mealy = 0; x_moore = 0;
        #10 x_mealy = 1; x_moore = 1;
        #10 x_mealy = 0; x_moore = 0;
        #10;
        $finish;
    end
endmodule
