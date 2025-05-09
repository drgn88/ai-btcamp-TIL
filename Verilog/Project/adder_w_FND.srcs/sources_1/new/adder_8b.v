`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 11:00:44
// Design Name: 
// Module Name: adder_8b
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


module adder_8b (
    input [7:0] a,
    input [7:0] b,
    //input       cin,

    output       cout,
    output [7:0] sum
);

    wire w_c0;

    full_adder_4b FA4_L (
        .a(a[3:0]),
        .b(b[3:0]),
        .cin(1'b0),
        .cout(w_c0),
        .sum(sum[3:0])
    );

    full_adder_4b FA4_U (
        .a(a[7:4]),
        .b(b[7:4]),
        .cin(w_c0),
        .cout(cout),
        .sum(sum[7:4])
    );
endmodule
