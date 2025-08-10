`timescale 1ns / 1ps

module UpDownCounter (
    input logic clk,
    input logic rst,
    input logic btn_mode,
    input logic btn_runstop,
    input logic btn_clear,
    input [7:0] rx_data,

    output logic [13:0] count,
    output logic [ 1:0] led_mode,
    output logic [ 1:0] led_run_stop
);

    logic tick_10hz;
    logic mode;
    logic run_stop;
    logic clear;

    clk_div_10hz U_CLK_DIV_10HZ (
        .clk(clk),
        .rst(rst),
        .run_stop(run_stop),
        .clear(clear),

        .tick_10hz(tick_10hz)
    );

    up_down_counter U_Up_Down_Counter (
        .clk  (clk),
        .rst  (rst),
        .tick (tick_10hz),
        .mode (mode),
        .clear(clear),
        .count(count)
    );

    control_unit U_CONTROL_UNIT (
        .clk(clk),
        .rst(rst),
        .btn_mode(btn_mode),
        .btn_runstop(btn_runstop),
        .btn_clear(btn_clear),
        .rx_data(rx_data),

        .mode(mode),
        .run_stop(run_stop),
        .clear(clear),

        .led_mode(led_mode),
        .led_run_stop(led_run_stop)
    );

endmodule

module up_down_counter (
    input  logic        clk,
    input  logic        rst,
    input  logic        tick,
    input  logic        mode,
    input  logic        clear,
    output logic [13:0] count
);
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            count <= 0;
        end else begin
            if (clear) begin
                count <= 0;
            end
            if (mode == 1'b0) begin  // up counter
                if (tick) begin
                    if (count == 9999) begin
                        count <= 0;
                    end else begin
                        count <= count + 1;
                    end
                end
            end else begin  // down counter
                if (tick) begin
                    if (count == 0) begin
                        count <= 9999;
                    end else begin
                        count <= count - 1;
                    end
                end
            end
        end
    end
endmodule

module clk_div_10hz (
    input logic clk,
    input logic rst,
    input logic run_stop,
    input logic clear,

    output logic tick_10hz
);
    //logic [23:0] div_counter;
    logic [$clog2(10_000_000)-1:0] div_counter;

    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            div_counter <= 0;
            tick_10hz   <= 1'b0;
        end else begin
            if (run_stop) begin
                if (div_counter == 10_000_000 - 1) begin
                    div_counter <= 0;
                    tick_10hz   <= 1'b1;
                end else begin
                    div_counter <= div_counter + 1;
                    tick_10hz   <= 1'b0;
                end
            end
            if (clear) begin
                div_counter <= 0;
                tick_10hz   <= 1'b0;
            end
        end
    end
endmodule

module control_unit (
    input logic clk,
    input logic rst,
    input logic btn_mode,
    input logic btn_runstop,
    input logic btn_clear,
    input logic [7:0] rx_data,

    output logic mode,
    output logic run_stop,
    output logic clear,

    output logic [1:0] led_mode,
    output logic [1:0] led_run_stop
);

    /***************************MODE FSM**************************/

    typedef enum {
        UP,
        DOWN
    } state_mode_e;

    state_mode_e state_mode, next_state_mode;

    // state memory
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            state_mode <= UP;
        end else begin
            state_mode <= next_state_mode;
        end
    end

    // transition logic
    always_comb begin
        next_state_mode = state_mode;
        mode = 0;
        case (state_mode)
            UP: begin
                mode = 0;
                led_mode = 2'b01;
                if (btn_mode | (rx_data == 8'h6D)) begin
                    next_state_mode = DOWN;
                end
            end
            DOWN: begin
                led_mode = 2'b10;
                mode = 1;
                if (btn_mode | (rx_data == 8'h6D)) begin
                    next_state_mode = UP;
                end
            end
        endcase
    end

    /***************************RUN_STOP_CLEAR FSM**************************/
    typedef enum {
        STOP,
        RUN,
        CLEAR
    } state_rs_clr_e;

    state_rs_clr_e state_rs_clr, next_state_rs_clr;

    // state memory
    always_ff @(posedge clk, posedge rst) begin
        if (rst) begin
            state_rs_clr <= STOP;
        end else begin
            state_rs_clr <= next_state_rs_clr;
        end
    end

    // transition logic
    always_comb begin
        next_state_rs_clr = state_rs_clr;
        run_stop = 0;
        clear = 0;
        led_run_stop = 2'b00;
        case (state_rs_clr)
            STOP: begin
                run_stop = 0;
                led_run_stop = 2'b01;
                if (btn_runstop | (rx_data == 8'h72)) begin  //r
                    next_state_rs_clr = RUN;
                end else if (btn_clear | (rx_data == 8'h63)) begin  //c
                    next_state_rs_clr = CLEAR;
                end
            end
            RUN: begin
                run_stop = 1;
                led_run_stop = 2'b10;
                if (btn_runstop | (rx_data == 8'h73)) begin  //s
                    next_state_rs_clr = STOP;
                end
            end
            CLEAR: begin
                clear = 1;
                next_state_rs_clr = STOP;
            end
        endcase
    end

endmodule


// module uart_ctrl_unit (
//     input clk,
//     input rst,
//     input [7:0] rx_data,

//     output logic uart_mode,
//     output logic uart_run_stop,
//     output logic uart_clear,

//     output logic [1:0] led_uart_mode,
//     output logic [1:0] led_uart_run_stop
// );

// /**************************MODE FSM****************************/

//     typedef enum { 
//         UP,
//         DOWN
//      } mode_state_e;

//     mode_state_e mode_state, mode_state_next;

//     always_ff @( posedge clk or posedge rst ) begin
//         if(rst) begin
//             mode_state <= UP;
//         end
//         else begin
//             mode_state <= mode_state_next;
//         end
//     end

//     always_comb begin
//         mode_state_next = mode_state;
//         uart_mode = 0;
//         led_uart_mode = 2'b00;
//         case (mode_state)
//            UP : begin
//             uart_mode = 0;
//             led_uart_mode = 2'b01;
//             if(rx_data == 8'h6D) begin          //'m'
//                 mode_state_next = DOWN;
//             end
//            end
//            DOWN : begin
//             uart_mode = 1;
//             led_uart_mode = 2'b10;
//             if(rx_data == 8'h6D) begin
//                 mode_state_next = UP;
//             end
//            end
//         endcase
//     end

// /**************************RUN STOP CLEAR FSM****************************/

//     typedef enum { 
//         STOP,
//         RUN,
//         CLEAR
//      } rs_clr_state_e;

//      rs_clr_state_e rs_clr_state, rs_clr_state_next;

//      always_ff @( posedge clk or posedge rst ) begin
//         if(rst) begin
//             rs_clr_state <= STOP;
//         end
//         else begin
//             rs_clr_state <= rs_clr_state_next;
//         end
//      end

//      always_comb begin
//         rs_clr_state_next = rs_clr_state;
//         uart_run_stop = 0;
//         uart_clear = 0;
//         led_uart_run_stop = 2'b00;
//         case (rs_clr_state)
//            STOP : begin
//             uart_run_stop = 0;
//             led_uart_run_stop = 2'b01;
//             if(rx_data == 8'h72) begin          //'r'
//                 rs_clr_state_next = RUN;
//             end
//             else if(rx_data == 8'h63) begin     //'c'
//                 rs_clr_state_next = CLEAR;
//             end
//            end
//            RUN : begin
//             uart_run_stop = 1;
//             led_uart_run_stop = 2'b10;
//             if(rx_data == 8'h73) begin          //'s'
//                 rs_clr_state_next = STOP;
//             end
//            end
//            CLEAR : begin
//             uart_clear = 1;
//             rs_clr_state_next = STOP;
//            end
//         endcase
//      end
// endmodule
