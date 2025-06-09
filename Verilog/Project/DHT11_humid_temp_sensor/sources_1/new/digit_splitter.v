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
    input [7:0] rh_data,
    input [7:0] temp_data,

    output [3:0] digit_1,
    output [3:0] digit_10,
    output [3:0] digit_100,
    output [3:0] digit_1000
);



    assign digit_1    = rh_data % 10;
    assign digit_10   = (rh_data / 10);
    assign digit_100  = temp_data % 10;
    assign digit_1000 = (temp_data / 10);

endmodule
