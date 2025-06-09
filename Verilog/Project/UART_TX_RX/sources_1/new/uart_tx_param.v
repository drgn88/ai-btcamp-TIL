`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/22 12:48:01
// Design Name: 
// Module Name: uart_tx_param
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


module uart_tx_param (
    input clk,
    input rst,
    input baud_tick,
    input start_trigger,
    input [7:0] i_data,

    output tx_data
);

    localparam IDLE = 3'd0;
    localparam START = 3'd1;
    localparam DATA = 3'd2;
    localparam STOP = 3'd3;
    localparam WAIT = 3'd4;

    reg [3:0] state, next_state;
    reg tx_reg, tx_next;
    reg [2:0] data_cnt_reg, data_cnt_next;

    assign tx_data = tx_reg;

    //state register
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 0;
            tx_reg <= 1;
            data_cnt_reg <= 0;  //data bit 전송 반복구조 위함
        end
        begin
            state <= next_state;
            tx_reg <= tx_next;
            data_cnt_reg <= data_cnt_next;
        end
    end

    //Next state logic
    always @(*) begin
        
        case (state)
            IDLE:
            if (start_trigger) begin
                next_state = START;
                tx_next = 1;
            end else begin
                next_state = IDLE;
                tx_next = 1;
            end
            START:
            if (baud_tick) begin
                next_state = DATA;
                tx_next = 0;
                data_cnt_next = 0;
            end else begin
                next_state = START;
                tx_next = 1;
                data_cnt_next = 0;
            end
            DATA:
            if (baud_tick) begin
                tx_next = i_data[data_cnt_reg];
                if(data_cnt_reg == 3'd7) begin
                    next_state = STOP;
                end
                else begin
                    data_cnt_next = data_cnt_reg + 1;
                end
            end
            STOP:
            if (baud_tick) begin
                next_state = WAIT;
                tx_next = 1;
            end else begin
                next_state = STOP;
                tx_next = i_data[7];
            end
            WAIT:
            if (baud_tick) begin
                next_state = IDLE;
                tx_next = 1;
            end else begin
                next_state = WAIT;
                tx_next = 1;
            end
            default: begin
                next_state = IDLE;
                tx_next = 1;
                data_cnt_next = 0;
            end
        endcase
    end
endmodule
