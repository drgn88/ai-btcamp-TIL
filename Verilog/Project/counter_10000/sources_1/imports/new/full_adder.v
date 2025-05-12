`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 09:46:57
// Design Name: 
// Module Name: full_adder
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


module full_adder (
    input in1,
    input in2,
    input cin,

    output cout,
    output sum
);

    wire w_c0, w_c1;
    wire w_s0;

    half_adder HA0 (
        .in1 (in1),
        .in2 (in2),
        .cout(w_c0),
        .sum (w_s0)
    );

    half_adder HA1 (
        .in1 (cin),
        .in2 (w_s0),
        .cout(w_c1),
        .sum (sum)
    );

    assign cout = w_c0 | w_c1;

endmodule
