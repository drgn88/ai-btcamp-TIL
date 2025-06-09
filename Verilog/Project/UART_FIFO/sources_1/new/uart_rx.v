`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/23 11:41:50
// Design Name: 
// Module Name: uart_rx
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


module uart_rx (
    input clk,
    input rst,
    input rx_data,
    input baud_tick,

    output [7:0] o_dout,
    output o_rx_done
);

    localparam IDLE = 0;
    localparam START = 1;
    localparam DATA = 2;
    localparam READ = 3;
    localparam STOP = 4;

    reg [2:0] state, next_state;
    reg [3:0] b_cnt_reg, b_cnt_next;
    reg [3:0] data_cnt_reg, data_cnt_next;
    reg rx_done_reg, rx_done_next;
    reg [7:0] dout_reg, dout_next;

    assign o_dout = dout_reg;
    assign o_rx_done = rx_done_reg;

    //State register
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 0;
            b_cnt_reg <= 0;
            data_cnt_reg <= 0;
            dout_reg <= 0;
            rx_done_reg = 0;
        end else begin
            state <= next_state;
            b_cnt_reg <= b_cnt_next;
            data_cnt_reg <= data_cnt_next;
            dout_reg <= dout_next;
            rx_done_reg = rx_done_next;
        end
    end

    //Next state logic
    always @(*) begin
        next_state = state;
        b_cnt_next = b_cnt_reg;
        data_cnt_next = data_cnt_reg;
        dout_next = dout_reg;
        rx_done_next = 0;
        case (state)
            IDLE: begin
                b_cnt_next = 0;
                data_cnt_next = 0;
                rx_done_next = 0;
                if (baud_tick) begin
                    if (rx_data == 0) begin
                        next_state = START;
                    end
                end
            end
            START:
            if (baud_tick == 1) begin
                if (b_cnt_reg == 11) begin
                    next_state = READ;
                    data_cnt_next = 0;
                    b_cnt_next = 0;
                end else begin
                    b_cnt_next = b_cnt_reg + 1;
                end
            end
            READ: begin
                dout_next  = {rx_data, dout_reg[7:1]};
                next_state = DATA;
            end
            DATA: begin
                if (baud_tick == 1) begin
                    if (b_cnt_reg == 7) begin
                        if (data_cnt_reg == 7) begin
                            next_state = STOP;
                            b_cnt_next = 0;
                            data_cnt_next = 0;
                        end else begin
                            b_cnt_next = 0;
                            next_state = READ;
                            data_cnt_next = data_cnt_reg + 1;
                        end
                    end else begin
                        b_cnt_next = b_cnt_reg + 1;
                    end
                end
            end
            STOP:
            if (baud_tick) begin
                next_state   = IDLE;
                rx_done_next = 1;
            end
        endcase
    end
endmodule
