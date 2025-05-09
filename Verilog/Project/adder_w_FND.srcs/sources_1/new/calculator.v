`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 15:27:35
// Design Name: 
// Module Name: calculator
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


module calculator (
    //input       cin,
    input [7:0] in1,
    input [7:0] in2,
    input [1:0] btn,

    output [7:0] fnd_data,
    output [3:0] fnd_com
    
);
    wire [7:0] w_sum0;
    wire w_c0;
    wire [8:0] w_sc;

    assign w_sc = {w_c0, w_sum0};

    //assign cin = 1'b0;
    //assign fnd_com = 4'b1110;

    decoder_2x4 U_DEC0 (
        .btn(btn),

        .fnd_com(fnd_com)
    );


    adder_8b U_ADD8 (
        .a(in1),
        .b(in2),
        //.cin(cin),

        .cout(w_c0),
        .sum (w_sum0)
    );

    fnd_ctrl U_FND0 (
        .sum(w_sc),
        .btn(btn),
        .fnd_data(fnd_data)
    );

endmodule
