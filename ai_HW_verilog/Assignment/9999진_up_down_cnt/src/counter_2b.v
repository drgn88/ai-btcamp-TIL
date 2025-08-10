`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/15 16:47:47
// Design Name: 
// Module Name: counter_2b
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


module counter_2b (
    input clk,
    input rstn,

    output reg [1:0] fnd_sel
);

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            fnd_sel <= 2'b00;
        end else if (fnd_sel == 2'b11) begin
            fnd_sel <= 2'b00;
        end else begin
            fnd_sel <= fnd_sel + 1'b1;
        end
    end

endmodule
