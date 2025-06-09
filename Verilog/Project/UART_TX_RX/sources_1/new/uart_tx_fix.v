`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/22 17:47:32
// Design Name: 
// Module Name: uart_tx_fix
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


module uart_tx_fix (
    input clk,
    input rst,
    input baud_tick,
    input trig,
    input [7:0] i_data,

    output tx
);

    localparam IDLE = 0;
    localparam WAIT_START = 1;
    localparam START = 2;
    localparam DATA = 3;
    localparam STOP = 5;

    reg [2:0] state, next_state;
    reg [2:0] d_cnt, d_cnt_next;
    reg tx_reg, tx_next;

    assign tx = tx_reg;

    //state register
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state  <= IDLE;
            d_cnt  <= 0;
            tx_reg <= 1;
        end else begin
            state  <= next_state;
            d_cnt  <= d_cnt_next;
            tx_reg <= tx_next;
        end
    end

    //Next State Logic
    always @(*) begin
        next_state = state;
        tx_next = tx_reg;
        d_cnt_next = d_cnt;
        case (state)
            IDLE:
            if (trig) begin
                next_state = WAIT_START;
            end else begin
                next_state = IDLE;
            end
            WAIT_START:
            if (baud_tick) begin
                next_state = START;
            end else begin
                next_state = WAIT_START;
            end
            START: begin
                tx_next = 0;
                d_cnt_next = 0;
                if (baud_tick) begin
                    next_state = DATA;
                end else begin
                    next_state = START;
                end
            end
            DATA : begin
                if(baud_tick) begin
                    if(d_cnt == 7) begin
                        next_state = STOP;
                    end
                    else begin
                        d_cnt_next = d_cnt + 1;
                        tx_next = i_data[d_cnt];
                    end
                end
                else begin
                    next_state = DATA;
                    tx_next = i_data[d_cnt];
                    d_cnt_next = d_cnt;
                end
            end
            STOP : begin
                tx_next = 1;
                if(baud_tick) begin
                    next_state = IDLE;
                end
                else begin
                    next_state = STOP;
                end
            end
            default: begin
               next_state = IDLE;
               tx_next = 1;
               d_cnt_next = 0; 
            end
        endcase
    end
endmodule
