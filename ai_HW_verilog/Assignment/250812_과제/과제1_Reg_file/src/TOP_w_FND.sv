`timescale 1ns / 1ps

module TOP_w_FND(
    input logic clk,
    input logic rst,

    output logic [ 3:0] fndCom,
    output logic [ 7:0] fndFont
    );

    logic [7:0] OutPort;

    logic [($clog2(10_000_000 - 1)-1):0] div_cnt;
    logic clk_10hz;

    always_ff @( posedge clk or posedge rst ) begin
        if(rst) begin
            div_cnt <= 0;
            clk_10hz <= 0;
        end
        else if(div_cnt == (10_000_000 - 1)) begin
            clk_10hz <= 1;
            div_cnt <= 0;
        end
        else begin
            clk_10hz <= 0;
            div_cnt <= div_cnt + 1;
        end

    end

    DedicatedProcessor PROCESSOR(
    .clk(clk_10hz),
    .rst(rst),

    .OutPort(OutPort)
    );

    fndController FND_CTRL(
    .clk(clk),
    .rst(rst),
    .number({6'b0 ,OutPort}),
    .fndCom(fndCom),
    .fndFont(fndFont)
    );
endmodule
