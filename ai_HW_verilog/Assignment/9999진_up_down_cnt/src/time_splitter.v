`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/06 10:26:05
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


module time_splitter(
    input [13:0] cnt,

    output [3:0] time_1,
    output [3:0] time_10,
    output [3:0] time_100,
    output [3:0] time_1000
    );

    assign time_1 = (cnt % 10);
    assign time_10 = ((cnt % 100) / 10);
    assign time_100 = ((cnt / 100) % 10);
    assign time_1000 = (cnt / 1000);

endmodule
