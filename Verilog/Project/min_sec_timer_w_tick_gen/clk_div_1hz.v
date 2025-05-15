`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 17:00:48
// Design Name: 
// Module Name: clk_div_1hz
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


module clk_div_1hz#(parameter F_CNT = 50_000_000 - 1)(
    input clk,
    input rst,

    output reg clk_1hz
    );

    reg [($clog2(F_CNT)- 1) : 0] r_cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            r_cnt <= 0;
            clk_1hz <= 0;
        end else if (r_cnt == F_CNT) begin
            r_cnt <= 0;
            clk_1hz <= ~clk_1hz;
        end else begin
            r_cnt <= r_cnt + 1'b1;
        end
    end

endmodule
