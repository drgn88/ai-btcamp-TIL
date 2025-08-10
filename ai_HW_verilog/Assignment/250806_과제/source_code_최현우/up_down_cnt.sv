`timescale 1ns / 1ps


module up_down_cnt (
    input clk,
    input rst,
    // input sw_mode,
    input btn_mode,

    output logic [13:0] count
);

    logic w_tick_10hz;
    logic o_btn;
    logic mode;

    clk_div_10hz CLK_DIV_10HZ (
        .clk(clk),
        .rst(rst),

        .tick_10hz(w_tick_10hz)
    );

    btn_debouncer BTN_DEBOUNCER (
        .clk  (clk),
        .rst  (rst),
        .i_btn(btn_mode),

        .o_btn(o_btn)
    );

    btn_mode_ctrl BTN_CTRL(
    .clk(clk),
    .rst(rst),
    .btn_mode(o_btn),

    .mode(mode)
);

    counter_up_down CNT_UP_DOWN (
        .clk (clk),
        .rst (rst),
        .tick(w_tick_10hz),
        .mode(mode),

        .cnt(count)
    );

endmodule

module btn_mode_ctrl (
    input clk,
    input rst,
    input btn_mode,

    output logic mode
);

    localparam TOGGLE_MODE = 0;
    localparam STAY = 1;

    logic state, next_state;
    logic mode_reg, mode_next;

    assign mode = mode_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            mode_reg <= 0;
            state <= TOGGLE_MODE;
        end else begin
            mode_reg <= mode_next;
            state <= next_state;
        end
    end

    always_comb begin
        mode_next  = mode_reg;
        next_state = state;
        case (state)
            TOGGLE_MODE: begin
                if (btn_mode) begin
                    next_state = STAY;
                end
            end
            STAY: begin
                if (!btn_mode) begin
                    next_state = TOGGLE_MODE;
                    mode_next  = ~mode_reg;
                end
            end
        endcase
    end

endmodule

module clk_div_10hz (
    input clk,
    input rst,

    output logic tick_10hz
);

    localparam FCNT = 10_000_000;  // 10Hz

    logic [($clog2(FCNT) - 1):0] div_counter;

    always_ff @(posedge clk or posedge rst) begin : tick_generator
        if (rst) begin
            tick_10hz   <= 1'b0;
            div_counter <= 1'b0;
        end else if (div_counter == (FCNT - 1)) begin
            tick_10hz   <= 1'b1;
            div_counter <= 1'b0;
        end else begin
            tick_10hz   <= 1'b0;
            div_counter <= div_counter + 1'b1;
        end
    end

endmodule


// CORE MODULE
module counter_up_down (
    input clk,
    input rst,
    input tick,
    input mode,

    output logic [13:0] cnt
);

    localparam MAX_CNT = 9999;
    localparam MIN_CNT = 0;

    always_ff @(posedge clk or posedge rst) begin : cnt_val_generate
        if (rst) begin
            cnt <= 0;
        end else if (!mode) begin  //UP COUNT
            if (tick) begin
                if (cnt == MAX_CNT) begin
                    cnt <= 0;
                end else begin
                    cnt <= cnt + 1;
                end
            end
        end else begin  //DOWN COUNT
            if (tick) begin
                if (cnt == MIN_CNT) begin
                    cnt <= 9999;
                end else begin
                    cnt <= cnt - 1;
                end
            end
        end
    end

endmodule
