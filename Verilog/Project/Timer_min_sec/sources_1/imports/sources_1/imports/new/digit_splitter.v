`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 14:25:07
// Design Name: 
// Module Name: digit_splitter
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


module digit_splitter (
    input [13:0] sum,

    output [3:0] digit_1,
    output [3:0] digit_10,
    output [3:0] digit_100,
    output [3:0] digit_1000
);



    assign digit_1    = sum % 10;
    assign digit_10   = (sum / 10) % 10;
    assign digit_100  = (sum / 100) % 10;
    assign digit_1000 = sum / 1000;

endmodule
