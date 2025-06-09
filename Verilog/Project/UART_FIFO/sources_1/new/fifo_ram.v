`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/27 14:02:31
// Design Name: 
// Module Name: fifo_ram
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


module fifo_ram (
    input clk,
    input rst,
    input pop,
    input push,
    input [7:0] push_data,

    output [7:0] pop_data,
    output full,
    output empty
);

    wire [3:0] w_w_ptr, w_r_ptr;

    fifo_cu U_FIFO_CU (
        .clk (clk),
        .rst (rst),
        .push(push),
        .pop (pop),

        .w_ptr(w_w_ptr),
        .r_ptr(w_r_ptr),
        .full (full),
        .empty(empty)
    );

    register_file #(
        .DEPTH(16),
        .WIDTH(4)
    ) U_REG_FILE (
        .clk(clk),
        .wr_en(((~full) & push)),
        .w_data(push_data),
        .w_ptr(w_w_ptr),  //write addr
        .r_ptr(w_r_ptr),  //read addr

        .r_data(pop_data)
    );
endmodule
