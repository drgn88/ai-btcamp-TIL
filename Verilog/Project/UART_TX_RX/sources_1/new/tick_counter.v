`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/22 14:35:47
// Design Name: 
// Module Name: tick_counter
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


module tick_counter #(parameter  DIV_CNT= 8)(
    input clk,
    input rst,
    input tick,

    output reg div_tick
    );

    reg [($clog2(DIV_CNT) - 1): 0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 0;
            div_tick <= 0;
        end
        else if((tick==1) && (cnt == (DIV_CNT - 1))) begin
            cnt <= 0;
            div_tick <= 1;
        end
        else if((tick==1) && (cnt != (DIV_CNT - 1))) begin
            cnt <= cnt + 1;
            div_tick <= 0;
        end
        else begin
            cnt <= cnt;
            div_tick <= 0;
        end
    end

endmodule
