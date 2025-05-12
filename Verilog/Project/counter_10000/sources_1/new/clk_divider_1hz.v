`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 16:50:56
// Design Name: 
// Module Name: clk_divider_1hz
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


module clk_divider_1hz(
    input clk,
    input rst,

    output reg oclk
    );

    parameter num = 50_000_000 - 1;
    //2fa_f080
    reg [27:0] cnt; 

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            cnt <= 28'h0;
            oclk = 1'h0;
        end
        else if(cnt == num) begin
            cnt <= 28'h0;
            oclk = ~oclk;
        end
        else begin
            cnt <= cnt + 1;
        end
    end 

endmodule
