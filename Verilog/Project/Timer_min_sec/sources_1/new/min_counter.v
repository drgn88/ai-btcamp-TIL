`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 16:44:25
// Design Name: 
// Module Name: min_counter
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


module min_counter(
    input clk,
    input rst,
    input carry,

    output [7:0] min
    );

    localparam MAX_MIN = 60;

    reg [7:0] r_min;

    assign min = (((r_min == (MAX_MIN - 1)) && (carry == 1)) || ((r_min == (MAX_MIN)) && (carry == 0))) ? 0 : carry + r_min;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            r_min <= 0;
        end
        else if(r_min == (MAX_MIN)) begin
            r_min <= 0;
        end
        else begin
            r_min <= r_min + carry;
        end
    end
    
endmodule
