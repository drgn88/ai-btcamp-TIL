`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/06 10:21:53
// Design Name: 
// Module Name: cnt_9999
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


module cnt_9999(
    input clk,
    input rstn,
    input up_tick,
    input down_tick,

    output reg [13:0] cnt
    );

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            cnt <= 0;      
        end
        else if(up_tick) begin
            if(cnt == 9999) begin
                cnt <= 0;
            end
            else begin
                cnt <= cnt + 1;
            end
        end
        else if(down_tick) begin
            if(cnt == 0) begin
                cnt <= 9999;
            end
            else begin
                cnt <= cnt - 1;
            end
        end
        else begin
            cnt <= cnt;
        end
    end
endmodule
