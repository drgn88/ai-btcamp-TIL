`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 11:36:39
// Design Name: 
// Module Name: tb_clk_div
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


module tb_clk_div ();

    //localparam DEBUG = 1;
    reg clk;
    reg rst;
    reg [1:0] sw;

    wire [7:0] fnd_data;
    wire [3:0] fnd_com;
    wire tick_gen;


    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    top_10000_cnt DUT (
        .clk(clk),
        .rst(rst),
        .sw (sw),

        .fnd_data(fnd_data),
        .fnd_com (fnd_com),
        .tick_gen(tick_gen)
    );
    
    //`ifdef DEBUG
    initial begin
        #0;
        rst = 1'b1;
        sw  = 2'b01;

        #10 rst = 1'b0;
        #10000000;

        $finish;
    end
    //`endif
endmodule
