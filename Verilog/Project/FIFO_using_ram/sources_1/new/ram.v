`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/27 11:23:18
// Design Name: 
// Module Name: ram
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

//순차논리 방식
module ram (
    input clk,
    input [7:0] addr,
    input [7:0] w_data,
    input wr,

    output [7:0] r_data
);

    reg [7:0] bram_mem;
    reg [7:0] mem[0:255];  // address 8bit

    assign r_data = bram_mem;

    always @(posedge clk) begin
        if (wr) begin
            mem[addr] <= w_data;
        end
        else begin
            bram_mem <= mem[addr];
        end
    end
endmodule

// // 조합논리 방식
// module ram (
//     input clk,
//     input [7:0] addr,
//     input [7:0] w_data,
//     input wr,

//     output [7:0] r_data
// );

//     reg [7:0] bram_mem;
//     reg [7:0] mem[0:255];  // address 8bit

//     assign r_data = mem[addr];

//     always @(posedge clk) begin
//         if (wr) begin
//             mem[addr] <= w_data;
//         end
//     end
// endmodule
