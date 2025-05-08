`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/08 10:51:38
// Design Name: 
// Module Name: gates
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


module gates(
    input   a,
    input   b,

    output  OR_G,
    output  AND_G,
    output  NOR_G,
    output  NAND_G,
    output  XOR_G,
    output  XNOR_G,
    output  INV_G
    );
/*
    assign  OR_G = a | b;
    assign  AND_G = a & b;
    assign  NOR_G = ~(a | b);
    assign  NAND_G = ~(a & b);
    assign  XOR_G = (a ^ b);
    assign  XNOR_G = ~(a ^ b);
    assign  INV_G = ~a;
*/

    AND2 AND0 (.a(a), .b(b), .y(AND_G));
    OR2 OR0 (.a(a), .b(b), .y(OR_G));
    NOR2 NOR0 (.a(a), .b(b), .y(NOR_G));
    NAND2 NAND0 (.a(a), .b(b), .y(NAND_G));
    XOR2 XOR0 (.a(a), .b(b), .y(XOR_G));
    XNOR2 XNOR0 (.a(a), .b(b), .y(XNOR_G));
    INV INV0 (.a(a), .b(b), .y(INV_G));
endmodule

module AND2(
    input   a,
    input   b,
    output  y
);

    assign  y = a & b;
endmodule

module OR2(
    input   a,
    input   b,
    output  y
);

    assign  y = a | b;
endmodule

module NOR2(
    input   a,
    input   b,
    output  y
);

    assign  y = ~(a | b);
endmodule

module NAND2(
    input   a,
    input   b,
    output  y
);

    assign  y = ~(a & b);
endmodule

module XOR2(
    input   a,
    input   b,
    output  y
);

    assign  y = a ^ b;
endmodule

module XNOR2(
    input   a,
    input   b,
    output  y
);

    assign  y = ~(a ^ b);
endmodule

module INV(
    input   a,
    input   b,
    output  y
);

    assign  y = ~a;
endmodule