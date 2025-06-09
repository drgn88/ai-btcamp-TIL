`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/21 16:22:18
// Design Name: 
// Module Name: Baud_tick_gen
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


module Baud_tick_gen #(
    parameter SYS_CLK = 100_000_000,
    parameter BAUD = 9600 * 8,
    parameter BAUD_COUNT = SYS_CLK / BAUD
) (
    input clk,
    input rst,

    //output baud_tick
    output reg baud_tick
);
    // 내 방식
    reg [($clog2(BAUD_COUNT) - 1) : 0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;
            baud_tick <= 0; 
        end
        else if(cnt == (BAUD_COUNT - 1)) begin
            cnt <= 0;
            baud_tick <= 1;
        end
        else begin
            cnt <= cnt + 1;
            baud_tick <= 0;
        end
    end

endmodule
