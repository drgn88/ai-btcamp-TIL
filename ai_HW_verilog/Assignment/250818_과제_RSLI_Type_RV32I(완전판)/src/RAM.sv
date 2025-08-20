`timescale 1ns / 1ps
`include "defines.sv"

module RAM (
    input logic clk,
    input logic we,
    input logic [1:0] store_size,
    input logic [31:0] addr,
    input logic [31:0] wData,

    output logic [31:0] rData
);

    logic [31:0] mem [0:9];

    always_ff @( posedge clk ) begin
        if(we) begin
            case (store_size)
                `SB: mem[addr[31:2]][7:0] <= wData[7:0];
                `SH: mem[addr[31:2]][15:0] <= wData[15:0];
                `SW: mem[addr[31:2]] <= wData;
                default: mem[addr[31:2]] <= wData;
            endcase
        end
    end

    assign rData = mem[addr[31:2]];
endmodule
