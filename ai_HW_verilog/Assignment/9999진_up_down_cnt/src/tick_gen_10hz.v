`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/06 10:20:04
// Design Name: 
// Module Name: tick_gen_10hz
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


module tick_gen_10hz (
    input clk,
    input rstn,

    output reg o_tick_10
);

    parameter FCNT = 10_000_000;
    //parameter FCNT = 10;
    //DEBUG:parameter FCNT = 1_0;
    reg [($clog2(FCNT) - 1) : 0] cnt;

    //output도 항상 초기화해주기
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            cnt <= 0;
            o_tick_10 <= 0;
        end else if (cnt == (FCNT - 1)) begin
            cnt <= 0;
            o_tick_10 <= 1;
        end else begin
            cnt <= cnt + 1;
            o_tick_10 <= 0;
        end
    end

endmodule