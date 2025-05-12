`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 17:05:36
// Design Name: 
// Module Name: tb_cnt_10000
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


module tb_cnt_10000 ();

    reg clk;
    reg rst;

    wire [7:0] fnd_data;
    wire [3:0] fnd_com;

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    top_10000_cnt DUT (
        .clk(clk),
        .rst(rst),

        .fnd_data(fnd_data),
        .fnd_com (fnd_com)
    );

    initial begin
        #0;
        rst = 1'b1;

        #10;
        rst = 1'b0;

        #100000000;

        $finish;
    end
endmodule
