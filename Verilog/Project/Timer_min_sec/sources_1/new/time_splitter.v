`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 16:53:06
// Design Name: 
// Module Name: time_splitter
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


module time_splitter (
    input [7:0] min,
    input [7:0] sec,

    output [3:0] sec_1,
    output [3:0] sec_10,
    output [3:0] min_1,
    output [3:0] min_10
);

    assign sec_1  = sec % 10;
    assign sec_10 = sec / 10;
    assign min_1  = min % 10;
    assign min_10 = min / 10;

endmodule
