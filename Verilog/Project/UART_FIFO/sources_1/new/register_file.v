`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/27 14:29:49
// Design Name: 
// Module Name: register_file
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


module register_file #(
    parameter DEPTH = 16,
    parameter WIDTH = 4
) (
    input clk,
    input wr_en,
    input [7:0] w_data,
    input [(WIDTH - 1):0] w_ptr,  //write addr
    input [(WIDTH - 1):0] r_ptr,  //read addr

    output [7:0] r_data
);

    reg [7:0] mem[0:(DEPTH - 1)];  // mem[0:2**WIDTH - 1]

    assign r_data = mem[r_ptr]; //조합논리로 출력: 속도 빠름

    always @(posedge clk) begin
        if (wr_en) begin
            mem[w_ptr] <= w_data;
        end
        // else begin
        //     r_data <= mem[r_ptr];   // 순차 논리로 출력: FPGA 합성 시 BRAM으로 합성
        // end
    end
endmodule
