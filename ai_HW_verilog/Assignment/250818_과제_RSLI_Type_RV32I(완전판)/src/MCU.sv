`timescale 1ns / 1ps

module MCU (
    input logic clk,
    input logic reset
);
    logic [31:0] instrCode;
    logic [31:0] instrMemAddr;
    logic        busWe;
    logic [31:0] busAddr;
    logic [31:0] busWData;
    logic [31:0] busRData;
    logic [1:0] store_size;

    ROM U_ROM (
        .addr(instrMemAddr),
        .data(instrCode)
    );
   CPU_RV32I U_RV32I(
    .clk(clk),
    .reset(reset),
    .instrCode(instrCode),
    .instrMemAddr(instrMemAddr),
    .busWe(busWe),
    .busAddr(busAddr),
    .busWData(busWData),
    .busRData(busRData),
    .store_size(store_size)
);

    RAM U_RAM(
    .clk(clk),
    .we(busWe),
    .store_size(store_size),
    .addr(busAddr),
    .wData(busWData),

    .rData(busRData)
    );
endmodule
