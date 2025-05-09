`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 10:42:58
// Design Name: 
// Module Name: full_adder_4b
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


module full_adder_4b (
    input [3:0] a,
    input [3:0] b,
    input       cin,

    output       cout,
    output [3:0] sum
);

    wire w_c0, w_c1, w_c2;

    full_adder FA0 (
        .in1 (a[0]),
        .in2 (b[0]),
        .cin (cin),
        .cout(w_c0),
        .sum (sum[0])
    );

    full_adder FA1 (
        .in1 (a[1]),
        .in2 (b[1]),
        .cin (w_c0),
        .cout(w_c1),
        .sum (sum[1])
    );

    full_adder FA2 (
        .in1 (a[2]),
        .in2 (b[2]),
        .cin (w_c1),
        .cout(w_c2),
        .sum (sum[2])
    );

    full_adder FA3 (
        .in1 (a[3]),
        .in2 (b[3]),
        .cin (w_c2),
        .cout(cout),
        .sum (sum[3])
    );

endmodule
