`timescale 1ns / 1ps


module up_down_cnt (
    input clk,
    input rst,
    // input sw_mode,
    input btn_mode,
    input btn_run_stop,
    input btn_clear,

    output logic [13:0] count,
    output logic [3:0] led
);

    logic w_tick_10hz;
    logic mode;
    logic falling_edge_detector;

    logic run_stop;
    logic clear;

    assign led[1:0] = (mode == 1'b0) ? 2'b01 : 2'b10;
    assign led[3:2] = (run_stop == 1'b0) ? 2'b01 : 2'b10;

    clk_div_10hz CLK_DIV_10HZ (
        .clk(clk),
        .rst((rst | (~run_stop))),

        .tick_10hz(w_tick_10hz)
    );

    btn_mode_ctrl BTN_CTRL (
        .clk(clk),
        .rst(rst),
        .btn_mode(btn_mode),

        .mode(mode)
    );

    run_stop_clear_ctrl U_RUN_STOP_CLEAR_CU(
    .clk(clk),
    .rst(rst),
    .btn_run_stop(btn_run_stop),
    .btn_clear(btn_clear),

    .run_stop(run_stop),
    .clear(clear)
    );

    counter_up_down CNT_UP_DOWN (
        .clk (clk),
        .rst ((rst | clear)),
        .tick(w_tick_10hz),
        .mode(mode),

        .cnt(count)
    );

endmodule

//////////////////////////////////////////////////////////////////
//                        내 방식                             //
//////////////////////////////////////////////////////////////////

// module btn_mode_ctrl (
//     input clk,
//     input rst,
//     input btn_mode,

//     output logic mode
// );

//     localparam TOGGLE_MODE = 0;
//     localparam STAY = 1;

//     logic state, next_state;
//     logic mode_reg, mode_next;

//     assign mode = mode_reg;

//     always_ff @(posedge clk or posedge rst) begin
//         if (rst) begin
//             mode_reg <= 0;
//             state <= TOGGLE_MODE;
//         end else begin
//             mode_reg <= mode_next;
//             state <= next_state;
//         end
//     end

//     always_comb begin
//         mode_next  = mode_reg;
//         next_state = state;
//         case (state)
//             TOGGLE_MODE: begin
//                 if (btn_mode) begin
//                     next_state = STAY;
//                 end
//             end
//             STAY: begin
//                 if (!btn_mode) begin
//                     next_state = TOGGLE_MODE;
//                     mode_next  = ~mode_reg;
//                 end
//             end
//         endcase
//     end

// endmodule

//////////////////////////////////////////////////////////////////
//                        교수님 방식                             //
//////////////////////////////////////////////////////////////////

module btn_mode_ctrl (
    input clk,
    input rst,
    input btn_mode,

    output logic mode
);

    typedef enum {
        UP,
        DOWN
    } state_e;

    state_e state, next_state;

    //State Register
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= UP;
        end else begin
            state <= next_state;
        end
    end

    //Next State Logic
    always_comb begin
        next_state = state;
        // mode = 0;
        case (state)
            UP: begin
                // mode = 0;
                if (btn_mode) begin
                    next_state = DOWN;
                end
            end
            DOWN: begin
                // mode = 1;
                if (btn_mode) begin
                    next_state = UP;
                end
            end
        endcase
    end

    //Output Logic(MOORE MACHINE)
    always_comb begin
        case (state)
            UP:   mode = 0;
            DOWN: mode = 1;
        endcase
    end

endmodule

module run_stop_clear_ctrl (
    input clk,
    input rst,
    input btn_run_stop,
    input btn_clear,

    output logic run_stop,
    output logic clear
);
    typedef enum { 
        STOP,
        RUN,
        CLEAR
     } state_e;

    state_e state, next_state;

    always_ff @( posedge clk or posedge rst ) begin
        if(rst)begin
            state <= STOP;
        end
        else begin
            state <= next_state;
        end
    end

    always_comb begin
        next_state = state;
        run_stop = 0;
        clear = 0;
        case (state)
            STOP : begin
                run_stop = 0;
                if(btn_run_stop) begin
                    next_state = RUN;
                end
                else if(btn_clear) begin
                    next_state = CLEAR;
                end
            end 
            RUN : begin
                run_stop = 1;
                if(btn_run_stop)begin
                    next_state = STOP;
                end
            end
            CLEAR : begin
                clear = 1;
                next_state = STOP;
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
