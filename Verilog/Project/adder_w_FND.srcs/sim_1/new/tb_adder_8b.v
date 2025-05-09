`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/09 11:23:55
// Design Name: 
// Module Name: tb_adder_8b
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


module tb_adder_8b ();

    reg  [7:0] a;
    reg  [7:0] b;
    //reg        cin;

    wire       cout;
    wire [7:0] sum;

    /*adder_8b DUT0 (
        .a(a),
        .b(b),
        //.cin(cin),
        .cout(cout),
        .sum(sum)
    );*/
    wire [7:0] fnd_data;
    wire [3:0] fnd_com;
    wire       led0;
    calculator DUT1 (
        //input       cin,
        .in1(a),
        .in2(b),
        .btn(2'b01),

        .fnd_data(fnd_data),
        .fnd_com(fnd_com),
        .led0(led0)
    );

    integer i, j;

    initial begin
        /*
        #0; // 0 delay * timescale 시간 (ns), begin-end에서는 시간이 누적됨
        cin = 0; a = 8'd1; b = 8'd10;

        #10;
        a = 8'd00; b = 8'd0;

        #10;
        a = 8'd255; b = 8'd255;

        #10;
        a = 8'd150; b = 8'd130;

        #10;
        a = 8'd150; b = 8'd100;

        #10;
        a = 8'd8; b = 8'd10;

        #10;
        a = 8'b1010_1010; b = 8'b0101_0101;

        #10;
        a = 8'd75; b = 8'd80;

        #10;
        a = 8'd90; b = 8'd34;

        #10;
        a = 8'd112; b = 8'd130;

        #10;
        a = 8'd91; b = 8'd10;

        #10; $finish;
        */

        /*
        #0;
        cin = 1'b0;
        a   = 8'h00;
        b   = 8'h00;

        for (i = 0; i <= 255; i = i + 1) begin
            for (j = 0; j <= 255; j = j + 1) begin
                a = i;
                b = j;
                #10;
            end
        end
        */

        #0;
        a = 8'd255;
        b = 8'd0;

        #10;

        $finish;
    end

endmodule
