`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/11 18:23:35
// Design Name: 
// Module Name: TOP_w_FND
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


module TOP_w_FND(
    input clk,
    input rst,

    output logic [ 3:0] fndCom,
    output logic [ 7:0] fndFont
    );

    logic [7:0] out_acc_sum;

    Accumulate_Sum_0to10 U_ACC_SUM(
    .clk(clk),
    .rst(rst),
    
    .out_acc_sum(out_acc_sum)
    );

    fndController U_FND_CTRL(
    .clk(clk),
    .rst(rst),
    .number({6'b0, out_acc_sum}),
    .fndCom(fndCom),
    .fndFont(fndFont)
    );
    
endmodule
