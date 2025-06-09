`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/22 16:36:14
// Design Name: 
// Module Name: uart_professor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module UART_tx (
    input clk,
    input rst,
    input baud_tick,
    input start,
    input [7:0] din,

    output o_tx,
    output o_tx_done,
    output o_tx_busy
);
    localparam IDLE = 0, START = 1, DATA = 2, STOP = 10;

    reg [3:0] c_state, n_state;
    reg tx_reg, tx_next;
    reg [2:0]
        data_cnt_reg,
        data_cnt_next;  //데이터 전송 반복 구조를 위해,
    reg [3:0] b_cnt_reg, b_cnt_next;

    reg tx_done_reg, tx_done_next;
    reg tx_busy_reg, tx_busy_next;

    assign o_tx = tx_reg;
    assign o_tx_done = tx_done_reg;
    assign o_tx_busy = tx_busy_reg;

    //state_register
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            c_state <= 0;
            tx_reg <= 1'b1;
            data_cnt_reg <= 0;
            b_cnt_reg <= 0;
            tx_done_reg <= 0;
            tx_busy_reg <= 0;
        end else begin
            c_state <= n_state;
            tx_reg <= tx_next;
            data_cnt_reg <= data_cnt_next;
            b_cnt_reg <= b_cnt_next;
            tx_done_reg <= tx_done_next;
            tx_busy_reg <= tx_busy_next;
        end
    end

    //next_state_CL
    always @(*) begin
        n_state = c_state;
        tx_next = tx_reg;
        data_cnt_next = data_cnt_reg;
        b_cnt_next = b_cnt_reg;
        tx_done_next = 0;
        tx_busy_next = tx_busy_reg;
        case (c_state)
            IDLE: begin
                b_cnt_next = 0;
                data_cnt_next = 0;
                tx_done_next = 0;
                tx_busy_next = 0;

                if (start == 1'b1) begin
                    n_state = START;
                    tx_busy_next = 1;
                end
            end
            START: begin
                if (baud_tick == 1'b1) begin
                    tx_next = 1'b0;
                    if (b_cnt_reg == 8) begin
                        n_state = DATA;
                        data_cnt_next = 0;
                        b_cnt_next = 0;
                    end else begin
                        b_cnt_next = b_cnt_reg + 1;
                    end
                end
            end
            DATA: begin
                tx_next = din[data_cnt_reg];
                if (baud_tick == 1'b1) begin
                    if (b_cnt_reg == 7) begin
                        if (data_cnt_reg == 3'b111) begin
                            n_state = STOP;
                        end
                        b_cnt_next = 0;
                        data_cnt_next = data_cnt_reg + 1;
                    end else begin
                        b_cnt_next = b_cnt_reg + 1;
                    end

                end
            end
            STOP: begin
                tx_next = 1;
                if (baud_tick == 1'b1) begin
                    if (b_cnt_reg == 7) begin
                        n_state = IDLE;
                        tx_done_next = 1;
                        tx_busy_next = 0;
                    end else begin
                        b_cnt_next = b_cnt_reg + 1;
                    end
                end
            end
        endcase
    end




endmodule


module baudrate (
    input  clk,
    input  rst,
    output baud_tick
);
    //CLK 100Mhz
    parameter BAUD = 9600;
    parameter BAUD_COUNT = 100_000_000 / (BAUD * 8);
    reg [$clog2(BAUD_COUNT)-1:0] count_reg, count_next;
    reg baud_tick_reg, baud_tick_next;



    assign baud_tick = baud_tick_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count_reg <= 0;
            baud_tick_reg <= 0;
        end else begin
            count_reg <= count_next;
            baud_tick_reg <= baud_tick_next;
        end
    end

    always @(*) begin
        count_next = count_reg;
        baud_tick_next = 0;
        if (count_reg == BAUD_COUNT - 1) begin
            count_next = 0;
            baud_tick_next = 1'b1;
        end else begin
            count_next = count_reg + 1;
            baud_tick_next = 1'b0;
        end
    end



endmodule


module uart_controller (
    input clk,
    input rst,
    input btn_start,
    //input [7:0] tx_din,
    input rx,

    output tx
    //output tx_done,
    //output rx_done,
    //output [7:0] rx_data
);

    wire w_bd_tick;
    wire w_start;

    wire w_tx_busy;

    wire [7:0] w_rx_dout;
    wire w_rx_done;

    assign rx_done = w_rx_done;

    btn_debouncer U_BTN_DEBOUNCE (
        .clk  (clk),
        .rst  (rst),
        .i_btn(btn_start),

        .o_btn(w_start)
    );


    UART_tx U_UART_TX (
        .clk(clk),
        .rst(rst),
        .baud_tick(w_bd_tick),
        .start((w_start | w_rx_done)),
        .din(w_rx_dout),
        .o_tx(tx),
        .o_tx_busy(w_tx_busy),
        .o_tx_done(tx_done)
    );

    uart_rx U_UART_RX (
        .clk(clk),
        .rst(rst),
        .rx_data(rx),
        .baud_tick(w_bd_tick),

        .o_dout(w_rx_dout),
        .o_rx_done(w_rx_done)
    );

    baudrate U_BR (
        .clk(clk),
        .rst(rst),
        .baud_tick(w_bd_tick)
    );

endmodule

