//ALU CONTROL
`define ADD 4'b0000
`define SUB 4'b1000
`define SLL 4'b0001
`define SRL 4'b0101
`define SRA 4'b1101
`define SLT 4'b0010
`define SLTU 4'b0011
`define XOR 4'b0100
`define OR 4'b0110
`define AND 4'b0111

//OPCODE TYPE
`define R_TYPE 7'b0110011
`define S_TYPE 7'b0100011
`define L_TYPE 7'b0000011
`define I_TYPE 7'b0010011
`define B_TYPE 7'b1100011