`timescale 1ns / 1ps

module top_UpDownCounter (
    input  logic       clk,
    input  logic       rst,
    input logic btn_mode,
    input logic btn_runstop,
    input logic btn_clear,
    input rx,

    output logic [3:0] fndCom,
    output logic [7:0] fndFont,
    output logic [ 1:0] led_mode,
    output logic [ 1:0] led_run_stop
);

    logic [13:0] count;
    logic button_edge_mode;
    logic button_edge_runstop;
    logic button_edge_clear;

    logic [7:0] rx_data;

    uart UART(
    .clk(clk),
    .rst(rst),
    .start(),
    .tx_data(),
    .rx(rx),

    .tx(),
    .tx_done(),
    .tx_busy(),

    .rx_data(rx_data),
    .rx_done(),
    .rx_busy()
    );

    button_detector U_ButtonDetector_MODE (
        .clk         (clk),
        .rst       (rst),
        .in_button   (btn_mode),
        .rising_edge (),
        .falling_edge(button_edge_mode),
        .both_edge   ()
    );

    button_detector U_ButtonDetector_RUN_STOP (
        .clk         (clk),
        .rst       (rst),
        .in_button   (btn_runstop),
        .rising_edge (button_edge_runstop),
        .falling_edge(),
        .both_edge   ()
    );

    button_detector U_ButtonDetector_CLEAR (
        .clk         (clk),
        .rst       (rst),
        .in_button   (btn_clear),
        .rising_edge (),
        .falling_edge(button_edge_clear),
        .both_edge   ()
    );

    UpDownCounter U_UpDownCounter (
        .clk   (clk),
        .rst (rst),
        .btn_mode(button_edge_mode),
        .btn_runstop(button_edge_runstop),
        .btn_clear(button_edge_clear),
        .rx_data(rx_data),

        .count (count),
        .led_mode(led_mode),
        .led_run_stop(led_run_stop)
    );

    fndController U_FndController (
        .clk    (clk),
        .rst  (rst),
        .number (count),
        .fndCom (fndCom),
        .fndFont(fndFont)
    );
endmodule
