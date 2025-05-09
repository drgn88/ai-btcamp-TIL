`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 12:46:14
// Design Name: 
// Module Name: fnd_ctrl
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


module fnd_ctrl (
    input [8:0] sum,
    input [1:0] btn,

    output [7:0] fnd_data
);

    wire [3:0] w_bcd;
    wire [3:0] w_digit_1, w_digit_10, w_digit_100, w_digit_1000;

    digit_splitter U_DGS0 (
        .sum(sum),
        .digit_1(w_digit_1),
        .digit_10(w_digit_10),
        .digit_100(w_digit_100),
        .digit_1000(w_digit_1000)
    );

    mux_4to1 U_MUX0 (
        .sel(btn),
        .digit_1(w_digit_1),
        .digit_10(w_digit_10),
        .digit_100(w_digit_100),
        .digit_1000(w_digit_1000),
        .bcd(w_bcd)
    );

    bcd_ctrl U_BCD0 (
        .bcd(w_bcd),
        .fnd_data(fnd_data)
    );


endmodule
