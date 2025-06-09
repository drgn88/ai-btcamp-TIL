`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/19 12:45:28
// Design Name: 
// Module Name: tb_debounce
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


module tb_debounce ();

    reg clk, rst, i_btn;
    wire o_btn;

    btn_debouncer DUT (
        .clk  (clk),
        .rst  (rst),
        .i_btn(i_btn),

        .o_btn(o_btn)
    );

    shift_debounce DUT0(
    .clk(clk),
    .rst(rst),
    .btn(i_btn),

    .pulse(o_btn)
    );

    initial begin
        clk = 1'b0;
        forever begin
            #1 clk = ~clk;
        end
    end

    initial begin
        #0;
        rst = 1; i_btn = 0;

        #3;
        rst = 0;

        #5;
        i_btn = 1;

        #7;
        i_btn = 0;

        #2;
        i_btn = 1;

        #2;
        i_btn = 0;

        #2;
        i_btn = 1;

        #7; 
        $stop;
    end
endmodule
