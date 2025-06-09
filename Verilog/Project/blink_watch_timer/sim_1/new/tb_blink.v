`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/19 16:37:59
// Design Name: 
// Module Name: tb_blink
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


module tb_blink ();

    reg clk;
    reg rst;
    reg btn_RS;
    reg btn_CLR;
    reg sw;

    wire [7:0] fnd_data;
    wire [3:0] fnd_com;

    stop_watch DUT (
        .clk(clk),
        .rst(rst),
        .btn_RS(btn_RS),
        .btn_CLR(btn_CLR),
        .sw(sw),

        .fnd_com (fnd_com),
        .fnd_data(fnd_data)
    );

    initial begin
        clk = 1'b0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        #0;
        rst = 1; btn_RS = 0; btn_CLR = 0; sw = 0;

        #2;
        rst = 0; btn_RS = 1;

        #30;
        btn_RS = 0;

        #1000;

        $stop;
    end

endmodule
