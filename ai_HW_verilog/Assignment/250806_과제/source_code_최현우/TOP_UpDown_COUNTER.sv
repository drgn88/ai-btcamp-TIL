`timescale 1ns / 1ps

module TOP_UpDown_COUNTER (
    input clk,
    input rst,
    // input sw_mode,
    input btn_mode,

    output logic [3:0] fnd_com,
    output logic [7:0] fnd_font
);

    logic [13:0] count;

    up_down_cnt UP_DOWN_CNT (
        .clk(clk),
        .rst(rst),
        // .sw_mode(sw_mode),
        .btn_mode(btn_mode),

        .count(count)
    );

    FND_CTRL U_FND_CTRL(
    .clk(clk),
    .rst(rst),
    .number(count),

    .fnd_com(fnd_com),
    .fnd_font(fnd_font)
);
endmodule
