`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/28 15:32:04
// Design Name: 
// Module Name: tb_ultra_sonic
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


module tb_ultra_sonic(

    );

    reg clk;
    reg rst;
    reg start;
    reg echo;

    wire trig;
    wire [9:0] distance;
    wire dist_done;

    sr04_ctrl DUT(
    .clk(clk),
    .rst(rst),
    .start(start),
    .echo(echo),

    .trig(trig),
    .distance(distance),
    .dist_done(dist_done)
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
        start = 0;
        echo = 0;

        #20;
        rst = 0;

        #10;
        start = 1;

        #10;
        start = 0;

        #10000;

        #100;
        echo = 1;

        #600000;
        echo = 0;

        #100;

        $stop;
    end
endmodule
