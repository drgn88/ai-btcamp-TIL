`timescale 1ns / 1ps

module TOP_UpDown_COUNTER (
    input clk,
    input rst,
    // input sw_mode,
    input btn_mode,
    input btn_run_stop,
    input btn_clear,

    output logic [3:0] fnd_com,
    output logic [7:0] fnd_font,
    output logic [3:0] led
);

    logic [13:0] count;
    logic btn_mode_edge;
    logic btn_rs_edge;
    logic btn_clr_edge;

    btn_detector BTN_MODE_DETECT (
        .clk(clk),
        .rst(rst),
        .btn(btn_mode),

        .rising_edge_detector(),
        .falling_edge_detector(btn_mode_edge),
        .both_edge_detector()
    );

    btn_detector BTN_RS_DETECT (
        .clk(clk),
        .rst(rst),
        .btn(btn_run_stop),

        .rising_edge_detector(),
        .falling_edge_detector(btn_rs_edge),
        .both_edge_detector()
    );

    btn_detector BTN_CLR_DETECT (
        .clk(clk),
        .rst(rst),
        .btn(btn_clear),

        .rising_edge_detector(),
        .falling_edge_detector(btn_clr_edge),
        .both_edge_detector()
    );


    up_down_cnt UP_DOWN_CNT (
        .clk(clk),
        .rst(rst),
        // .sw_mode(sw_mode),
        .btn_mode(btn_mode_edge),
        .btn_run_stop(btn_rs_edge),
        .btn_clear(btn_clr_edge),

        .count(count),
        .led(led)
    );

    FND_CTRL U_FND_CTRL (
        .clk(clk),
        .rst(rst),
        .number(count),

        .fnd_com (fnd_com),
        .fnd_font(fnd_font)
    );
endmodule
