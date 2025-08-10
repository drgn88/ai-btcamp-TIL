`timescale 1ns / 1ps

module uart (
    input clk,
    input rst,
    input start,
    input [7:0] tx_data,
    input rx,

    output logic tx,
    output logic tx_done,
    output logic tx_busy,

    output logic [7:0] rx_data,
    output logic rx_done,
    output logic rx_busy
);

    logic baud_tick;

    baurate_gen U_BAUD_GEN (
        .clk(clk),
        .rst(rst),

        .baud_tick(baud_tick)
    );

    transmitter U_TRANSIMITTER (
        .clk(clk),
        .rst(rst),
        .tx_data(tx_data),
        .start(start),
        .baud_tick(baud_tick),

        .tx(tx),
        .tx_done(tx_done),
        .tx_busy(tx_busy)
    );

    receiver U_RECEIVER(
    .clk(clk),
    .rst(rst),
    .baud_tick(baud_tick),
    .rx(rx),

    .rx_data(rx_data),
    .rx_done(rx_done),
    .rx_busy(rx_busy)
    );
endmodule

module baurate_gen (
    input clk,
    input rst,

    output logic baud_tick
);
    localparam BAUD = 9600;
    localparam SYS_CLK = 100_000_000;
    localparam SAMPLE_RATE = 16;
    localparam BAUD_COUNT = SYS_CLK / BAUD / SAMPLE_RATE;

    logic [($clog2(BAUD_COUNT) - 1):0] baud_cnt;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            baud_tick <= 0;
            baud_cnt  <= 0;
        end else begin
            if (baud_cnt == (BAUD_COUNT - 1)) begin
                baud_cnt  <= 0;
                baud_tick <= 1;
            end else begin
                baud_cnt  <= baud_cnt + 1;
                baud_tick <= 0;
            end
        end
    end
endmodule

module transmitter (
    input clk,
    input rst,
    input [7:0] tx_data,
    input start,
    input baud_tick,

    output logic tx,
    output logic tx_done,
    output logic tx_busy
);

    typedef enum {
        IDLE,
        START,
        DATA,
        STOP
    } tx_state_e;

    tx_state_e state, next_state;

    logic tx_reg, tx_next;
    logic tx_done_reg, tx_done_next;
    logic tx_busy_reg, tx_busy_next;

    logic [7:0]
        temp_data_reg,
        temp_data_next;  //데이터 전송 중 전송 데이터 변경 방지

    logic [3:0] baud_tick_cnt_reg, baud_tick_cnt_next;

    logic [2:0] bit_cnt_reg, bit_cnt_next;


    assign tx = tx_reg;
    assign tx_busy = tx_busy_reg;
    assign tx_done = tx_done_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            tx_reg <= 0;
            temp_data_reg <= 8'b0;
            baud_tick_cnt_reg <= 0;
            bit_cnt_reg <= 0;
            tx_done_reg <= 0;
            tx_busy_reg <= 0;
        end else begin
            state <= next_state;
            tx_reg <= tx_next;
            temp_data_reg <= temp_data_next;
            baud_tick_cnt_reg <= baud_tick_cnt_next;
            bit_cnt_reg <= bit_cnt_next;
            tx_done_reg <= tx_done_next;
            tx_busy_reg <= tx_busy_next;
        end
    end

    always_comb begin
        next_state = state;
        tx_next = tx_reg;
        temp_data_next = temp_data_reg;
        bit_cnt_next = bit_cnt_reg;
        baud_tick_cnt_next = baud_tick_cnt_reg;
        tx_done_next = tx_done_reg;
        tx_busy_next = tx_busy_reg;
        case (state)
            IDLE: begin
                tx_next = 1;
                tx_done_next = 0;
                if (start) begin
                    temp_data_next = tx_data;
                    next_state = START;
                    baud_tick_cnt_next = 0;
                    bit_cnt_next = 0;
                    tx_busy_next = 1;
                end
            end
            START: begin
                tx_next = 0;
                if (baud_tick) begin
                    if (baud_tick_cnt_reg == 15) begin
                        next_state = DATA;
                        baud_tick_cnt_next = 0;
                    end else begin
                        baud_tick_cnt_next = baud_tick_cnt_reg + 1;
                    end
                end
            end
            DATA: begin
                tx_next = temp_data_reg[0];
                if (baud_tick) begin
                    if (baud_tick_cnt_reg == 15) begin
                        baud_tick_cnt_next = 0;
                        if (bit_cnt_reg == 7) begin
                            next_state   = STOP;
                            bit_cnt_next = 0;
                        end else begin
                            temp_data_next = {1'b0, temp_data_reg[7:1]};
                            bit_cnt_next   = bit_cnt_reg + 1;
                        end
                    end else begin
                        baud_tick_cnt_next = baud_tick_cnt_reg + 1;
                    end
                end
            end
            STOP: begin
                tx_next = 1;
                if (baud_tick) begin
                    if (baud_tick_cnt_next == 15) begin
                        next_state = IDLE;
                        baud_tick_cnt_next = 0;
                        tx_busy_next = 0;
                        tx_done_next = 1;
                    end else begin
                        baud_tick_cnt_next = baud_tick_cnt_reg + 1;
                    end
                end
            end
        endcase
    end

endmodule

module receiver (
    input clk,
    input rst,
    input baud_tick,
    input rx,

    output logic [7:0] rx_data,
    output logic rx_done,
    output logic rx_busy
);

    typedef enum { 
        IDLE,
        START,
        DATA,
        STOP
     } rx_state_e;

     rx_state_e state, next_state;

    logic [7:0] rx_data_reg, rx_data_next;
    logic rx_done_reg, rx_done_next;
    logic rx_busy_reg, rx_busy_next;

    logic [4:0] tick_cnt_reg, tick_cnt_next;
    logic [2:0] bit_cnt_reg, bit_cnt_next;

    assign rx_data = rx_data_reg;
    assign rx_done = rx_done_reg;
    assign rx_busy = rx_busy_reg;

    always_ff @( posedge clk or posedge rst ) begin
        if(rst) begin
            state <= IDLE;
            rx_data_reg <= 0;
            rx_done_reg <= 0;
            rx_busy_reg <= 0;
            tick_cnt_reg <= 0;
            bit_cnt_reg <= 0;
        end
        else begin
            state <= next_state;
            rx_data_reg <= rx_data_next;
            rx_done_reg <= rx_done_next;
            rx_busy_reg <= rx_busy_next;
            tick_cnt_reg <= tick_cnt_next;
            bit_cnt_reg <= bit_cnt_next;
        end
    end

    always_comb begin
        next_state = state;
        rx_data_next = rx_data_reg;
        rx_done_next = rx_done_reg;
        rx_busy_next = rx_busy_reg;
        tick_cnt_next = tick_cnt_reg;
        bit_cnt_next = bit_cnt_reg;
        case (state)
           IDLE : begin
            rx_done_next = 0;
            rx_data_next = 0;
            if(!rx) begin
                next_state = START;
                tick_cnt_next = 0;
                bit_cnt_next = 0;
                rx_busy_next = 1;
            end
           end
           START : begin
            if(baud_tick) begin
                if(tick_cnt_reg == 7) begin
                    next_state = DATA;
                    // rx_data_next = 0;
                    tick_cnt_next = 0;
                end
                else begin
                    tick_cnt_next = tick_cnt_reg + 1;
                end
            end
           end
           DATA : begin
            if(baud_tick) begin
                if(tick_cnt_reg == 15) begin
                   tick_cnt_next = 0;
                   rx_data_next = {rx, rx_data_reg[7:1]};
                   if(bit_cnt_reg == 7)begin
                    next_state = STOP;
                    bit_cnt_next = 0;
                   end 
                   else begin
                    bit_cnt_next = bit_cnt_reg + 1;
                   end
                end
                else begin
                    tick_cnt_next = tick_cnt_reg + 1;
                end
            end
           end
           STOP : begin
            if(baud_tick) begin
                if(tick_cnt_reg == 23) begin
                    tick_cnt_next = 0;
                    rx_done_next = 1;
                    rx_busy_next = 0;
                    // rx_data_next = 0;
                    next_state = IDLE;
                end
                else begin
                    tick_cnt_next = tick_cnt_reg + 1;
                end
            end
           end 
        endcase
    end

endmodule
