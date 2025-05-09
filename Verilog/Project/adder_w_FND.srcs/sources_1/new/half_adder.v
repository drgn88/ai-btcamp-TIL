`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 09:39:04
// Design Name: 
// Module Name: half_adder
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


module half_adder (
    input in1,
    input in2,

    output cout,
    output sum
);

    /*
    assign sum  = in1 ^ in2;
    assign cout = in1 & in2;
    */

    // Using Primitive cell
    xor (sum, in1, in2);
    and (cout, in1, in2);

endmodule
