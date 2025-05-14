`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 14:30:06
// Design Name: 
// Module Name: sw_ctrl
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


module sw_ctrl (
    input [1:0] sw,
    input clk,
    input rst,

    output reg oclk,
    output reg orst
);

    always @(*) begin
        if (!sw[0]) begin
            oclk = 1'b0;
        end else begin
            oclk = clk;
        end
    end

    always @(*) begin
        if (sw[1]) begin
            orst = 1'b1;
        end else begin
            orst = rst;
        end
    end



endmodule
