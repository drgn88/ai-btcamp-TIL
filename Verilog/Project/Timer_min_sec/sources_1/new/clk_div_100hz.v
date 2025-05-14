`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 12:21:18
// Design Name: 
// Module Name: clk_div_100hz
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


module clk_div_100hz #(parameter F_CNT = 500_000 - 1)(
    input clk,
    input rst,

    output reg clk_100hz
);

    //parameter F_CNT = 500_000 - 1;

    reg [($clog2(F_CNT)- 1) : 0] r_cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            r_cnt <= 0;
            clk_100hz <= 0;
        end else if (r_cnt == F_CNT) begin
            r_cnt <= 0;
            clk_100hz <= ~clk_100hz;
        end else begin
            r_cnt <= r_cnt + 1'b1;
        end
    end
   
endmodule
