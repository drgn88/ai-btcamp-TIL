`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/21 16:48:18
// Design Name: 
// Module Name: baud_tick_always
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


module baud_tick_always #(
    parameter SYS_CLK = 100_000_000,
    parameter BAUD = 9600,
    parameter BAUD_COUNT = SYS_CLK / BAUD
)(
    input clk,
    input rst,

    output baud_tick
    );

    reg [($clog2(BAUD_COUNT) - 1) : 0] cnt, cnt_next;
    reg baud_tick_reg, baud_tick_next;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;
            baud_tick_reg <= 0;
        end
        else begin
            cnt <= cnt_next;
            baud_tick_reg <= baud_tick_next;
        end
    end

    always @(*) begin
        if(cnt == (BAUD_COUNT - 1)) begin
            cnt_next = 0;
            baud_tick_next = 1;
        end
        else begin
            cnt_next = cnt + 1;
            baud_tick_next = 0;
        end
    end

    assign baud_tick = baud_tick_reg;
    
endmodule
