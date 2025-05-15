`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 16:32:58
// Design Name: 
// Module Name: sec_counter
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


module sec_counter(
    input clk_div,
    input rst,

    output reg [7:0] sec,
    output carry
    );

    localparam  MAX_SEC = 60;
    reg r_carry;

    assign carry = r_carry;

    always @(posedge clk_div or posedge rst) begin
        if (rst) begin
            sec <= 8'h0;
            r_carry <= 1'b0;
        end
        else if(sec == (MAX_SEC - 1)) begin
            sec <= 8'h0;
            r_carry <= 1'b1;
        end
        else begin
            sec <= sec + 1'b1;
            r_carry <= 1'b0;
        end
    end

endmodule
