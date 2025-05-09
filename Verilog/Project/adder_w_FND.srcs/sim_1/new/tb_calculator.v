`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 18:04:30
// Design Name: 
// Module Name: tb_calculator
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


module tb_calculator ();

    reg  [7:0] in1;
    reg  [7:0] in2;
    reg  [1:0] btn;

    wire [7:0] fnd_data;
    wire [3:0] fnd_com;

    calculator DUT (
        .in1(in1),
        .in2(in2),
        .btn(2'b00),

        .fnd_data(fnd_data),
        .fnd_com (fnd_com)
    );

    integer i, j;

    initial begin
        #0;
        in1 = 8'd255; in2 = 8'd255;

        #10;
        in1 = 8'd0; in2 = 8'd0;

        #10;
        in1 = 8'hAA; in2 = 8'h55;

        #10;
        in1 = 8'd100; in2 = 8'd155;

        for(i = 101; i <= 110; i = i+1)
        begin
            for(j = 150; j <= 151; j= j+1)
            begin
                in1 = i;
                in2 = j;
                #10;
            end
        end

        #10;
        $finish;
    end
endmodule
