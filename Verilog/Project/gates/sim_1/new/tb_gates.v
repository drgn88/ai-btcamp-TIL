`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/08 14:10:04
// Design Name: 
// Module Name: tb_gates
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


module tb_gates(

    );

    reg     tb_a;
    reg     tb_b;
    reg     clk;

    wire    tb_and;
    wire    tb_or;
    wire    tb_nor;
    wire    tb_nand;
    wire    tb_xor;
    wire    tb_xnor;
    wire    tb_inv;


    // Procedure assignment(initial)
    initial begin
        clk = 1'b1;
        forever begin
            #5 clk = ~clk;
        end
    end

    gates TB0 (.a(tb_a), 
                .b(tb_b), 
                .OR_G(tb_or), 
                .AND_G(tb_and), 
                .NOR_G(tb_nor), 
                .NAND_G(tb_nand), 
                .XOR_G(tb_xor), 
                .XNOR_G(tb_xnor), 
                .INV_G(tb_inv)
                );

    initial begin
        //10ns
        #10
        tb_a = 1'b0;
        tb_b =  1'b0;

        //20ns
        #10
        tb_a = 1'b0;
        tb_b =  1'b1;

        //30ns
        #10
        tb_a = 1'b1;
        tb_b =  1'b0;

        //40ns
        #10
        tb_a = 1'b1;
        tb_b =  1'b1;

        //50ns
        #10
        $finish;
    end


endmodule
