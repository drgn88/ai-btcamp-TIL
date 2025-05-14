`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/12 14:40:45
// Design Name: 
// Module Name: clk_divider_1k
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


module clk_divider_1k (
    input clk,
    input rst,

    output reg oclk
);
    //16'hC350 == 50*10^3: 100MHz --> 1KHz
    
    parameter CLK_1K = 50_000 - 1;

    reg [($clog2(CLK_1K) - 1):0] cnt;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt  = 0;
            oclk = 1'b0;
        end
        else if (cnt == CLK_1K) begin
            cnt  = 0;
            oclk = ~oclk;
        end 
        else cnt = cnt + 1'b1;
    end
endmodule
