`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/08 15:09:07
// Design Name: 
// Module Name: adder
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


module full_adder(
    input   a,
    input   b,
    input   cin,

    output  cout,
    output  sum
    );

    wire    w_c0, w_c1;
    wire    w_s0;

    half_add U0 (
    .a(a),
    .b(b),
    .cout(w_c0),
    .sum(w_s0)
    );

    half_add U1 (
    .a(w_s0),
    .b(cin),
    .cout(w_c1),
    .sum(sum)
    );

    assign cout = w_c0 | w_c1;

endmodule
