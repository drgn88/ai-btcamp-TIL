`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/27 11:36:22
// Design Name: 
// Module Name: tb_mem
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


module tb_mem ();

    reg clk;
    reg [7:0] addr;
    reg [7:0] w_data;
    reg wr;

    wire [7:0] r_data;

    ram DUT (
        .clk(clk),
        .addr(addr),
        .w_data(w_data),
        .wr(wr),

        .r_data(r_data)
    );

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        //조합
        #0;
        wr = 0;
        addr = 0;
        w_data = 0;

        #10;
        wr = 1'b1;

        #10;
        addr   = 8'h0;
        w_data = 8'h55;
        #10;
        addr   = 8'h1;
        w_data = 8'h56;
        #10;
        addr   = 8'h2;
        w_data = 8'h88;
        
        #20;
        wr = 1'b0;
        addr = 8'h0;
        #10;
        addr = 8'h1;
        #10;
        addr = 8'h2;

        #100;

        $stop;

        
        
    end
endmodule
