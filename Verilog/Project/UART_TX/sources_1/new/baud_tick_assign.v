`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/21 16:48:04
// Design Name: 
// Module Name: baud_tick_assign
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


module baud_tick_assign #(
    parameter SYS_CLK = 100_000_000,
    parameter BAUD = 9600,
    parameter BAUD_COUNT = SYS_CLK / BAUD
)(
    input clk,
    input rst,

    output baud_tick
    );

    reg [($clog2(BAUD_COUNT) - 1) : 0] cnt;
    wire [($clog2(BAUD_COUNT) - 1) : 0] cnt_next;

    assign cnt_next = (cnt == (BAUD_COUNT - 1)) ? 0 : cnt +1;
    assign baud_tick = (cnt == (BAUD_COUNT - 1)) ? 1 : 0;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;
        end
        else begin
            cnt <= cnt_next;
        end
    end
endmodule
