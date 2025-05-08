`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/08 15:26:55
// Design Name: 
// Module Name: tb_adder
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


module tb_adder(

    );

    reg  [3:0]    a;
    reg  [3:0]    b;
    reg         cin;
    reg         clk;

    wire        cout;
    wire  [3:0]  sum;

    initial begin
        clk = 1'b0;
        forever begin
            #5 clk = ~clk;
        end
    end

    adder_4b TB0 (
    .a(a),
    .b(b),
    .cin(cin),
    .cout(cout),
    .sum(sum)
    );

    
    initial begin

        #0
        a = 4'd0; b = 4'd0; cin = 1'd0;

        #10
        a = 4'd15; b = 4'd15; cin = 1'd1;

        #10
        a = 4'd3; b = 4'd12; cin = 1'd1;

        #10
        a = 4'd5; b = 4'd7; cin = 1'd1;

        #10
        a = 4'd10; b = 4'd8; cin = 1'd0;

        #10
        a = 4'd7; b = 4'd5; cin = 1'd1;

        #10
        a = 4'd3; b = 4'd12; cin = 1'd1;

        #10
        a = 4'b0101; b = 4'b1010; cin = 1'd0;
        
        #10
        a = 4'd1; b = 4'd14; cin = 1'd0;

        #10
        a = 4'd2; b = 4'd10; cin = 1'd1;

        #10
        a = 4'd5; b = 4'd5; cin = 1'd1;

        #10 $finish;
        
    end

endmodule
