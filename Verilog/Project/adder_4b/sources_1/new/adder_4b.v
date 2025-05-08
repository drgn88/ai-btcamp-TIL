`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/08 16:08:13
// Design Name: 
// Module Name: adder_4b
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


module adder_4b(
    input  wire [3:0]   a,
    input  wire [3:0]   b,
    input  wire         cin,

    output wire         cout,
    output wire [3:0]   sum
    );

    wire    w_c0, w_c1, w_c2;

    full_adder ADD0 (.a(a[0]), .b(b[0]), .cin(cin), .cout(w_c0), .sum(sum[0]));
    full_adder ADD1 (.a(a[1]), .b(b[1]), .cin(w_c0), .cout(w_c1), .sum(sum[1]));
    full_adder ADD2 (.a(a[2]), .b(b[2]), .cin(w_c1), .cout(w_c2), .sum(sum[2]));
    full_adder ADD3 (.a(a[3]), .b(b[3]), .cin(w_c2), .cout(cout), .sum(sum[3]));

endmodule
