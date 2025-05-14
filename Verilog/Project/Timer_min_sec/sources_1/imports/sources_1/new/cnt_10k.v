`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 16:21:01
// Design Name: 
// Module Name: cnt_10k
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


module cnt_10k (
    input clk,
    input rst,

    output reg [13:0] cnt
);

    parameter num = 10000 - 1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 14'h0;
        end else if (cnt == num) begin
            cnt <= 14'h0;
        end else begin
            cnt <= cnt + 1'b1;
        end
    end
endmodule
