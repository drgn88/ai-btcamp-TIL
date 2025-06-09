`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/27 15:34:30
// Design Name: 
// Module Name: tb_fifo
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


module tb_fifo ();

    reg clk;
    reg rst;
    reg pop;
    reg push;
    reg [7:0] push_data;

    wire [7:0] pop_data;
    wire full;
    wire empty;

    fifo_ram DUT (
        .clk(clk),
        .rst(rst),
        .pop(pop),
        .push(push),
        .push_data(push_data),

        .pop_data(pop_data),
        .full(full),
        .empty(empty)
    );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    integer i;
    integer push_count, pop_count;
    reg rand_push;
    reg rand_pop;
    reg [7:0] compare_data[0:16-1];


    initial begin
        #0;
        rst = 1;
        pop = 0;
        push = 0;
        push_data = 0;

        #20;
        rst = 0;

        //full test
        for (i = 0; i < 17; i = i + 1) begin
            #10;
            push = 1;
            push_data = i;
        end
        #10;
        push = 0;

        //empty test
        for (i = 0; i < 17; i = i + 1) begin
            #10;
            pop = 1;
        end

        //동시 test
        pop = 0;
        for (i = 0; i < 20; i = i + 1) begin
            #10;
            push = 1;
            pop = 1;
            push_data = i+1;
        end

        #10;
        push = 0;
        #10;
        pop = 0;
        #10;
        $stop;
    end
endmodule
