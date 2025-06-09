`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/27 12:20:06
// Design Name: 
// Module Name: dual_port_ram
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


module dual_port_ram(
    input clk_w,
    input clk_r,
    input [7:0] w_addr,
    input [7:0] r_addr,
    input [7:0] w_data,
    input wr,
    input rd,

    output [7:0] r_data
    );
endmodule
