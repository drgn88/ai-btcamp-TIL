`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/29 11:55:53
// Design Name: 
// Module Name: dht11_ctrl
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


module dht11_ctrl (
    input clk,
    input rst,
    input i_tick,
    input start,

    output [7:0] rh_data,
    output [7:0] temp_data,
    output dht11_done,
    output [2:0] state_led,
    output dht11_valid,     //check sum

    inout dht11_io
);

    localparam IDLE = 0;
    localparam START = 1;
    localparam WAIT = 2;
    localparam SYNC_LOW = 3;
    localparam SYNC_HIGH = 4;
    localparam DATA_SYNC = 5;
    localparam DATA_DETECT = 6;
    localparam STOP = 7;

    reg [2:0] state, next_state;
    reg done_reg, done_next;
    reg [39:0] data_reg, data_next;
    reg [5:0] data_cnt_reg, data_cnt_next;
    reg [($clog2(1900) - 1) : 0] tick_cnt_reg, tick_cnt_next;
    reg dht11_reg, dht11_next;
    reg io_en_reg, io_en_next;
    reg valid_reg, valid_next;

    assign dht11_io = (io_en_reg) ? dht11_reg : 1'bz;
    assign state_led = state;
    assign dht11_valid = valid_reg;
    assign rh_data = data_reg[39:32];
    assign temp_data = data_reg[23:16];
    assign dht11_done = done_reg;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            done_reg <= 0;
            data_reg <= 0;
            data_cnt_reg <= 0;
            tick_cnt_reg <= 0;
            dht11_reg <= 1;
            io_en_reg <= 1;
            valid_reg <= 0;
        end else begin
            state <= next_state;
            done_reg <= done_next;
            data_reg <= data_next;
            data_cnt_reg <= data_cnt_next;
            tick_cnt_reg <= tick_cnt_next;
            dht11_reg <= dht11_next;
            io_en_reg <= io_en_next;
            valid_reg <= valid_next;
        end
    end

    always @(*) begin
        next_state = state;
        done_next = done_reg;
        data_next = data_reg;
        data_cnt_next = data_cnt_reg;
        tick_cnt_next = tick_cnt_reg;
        dht11_next = dht11_reg;
        io_en_next = io_en_reg;
        valid_next = valid_reg;
        case (state)
            IDLE: begin
                done_next  = 0;
                dht11_next = 1;
                io_en_next = 1;
                if (start) begin
                    next_state = start;
                    valid_next = 0;
                end
            end
            START: begin
                if (i_tick) begin
                    dht11_next = 1'b0;
                    if (tick_cnt_reg == (1900)) begin
                        next_state = WAIT;
                        tick_cnt_next = 0;
                    end else begin
                        tick_cnt_next = tick_cnt_reg + 1;
                    end
                end
            end
            WAIT: begin
                // 출력 high
                dht11_next = 1;
                if (i_tick) begin
                    if (tick_cnt_reg == (3 - 1)) begin
                        next_state = SYNC_LOW;
                        tick_cnt_next = 0;
                        //dht11_io를 입력으로 전환(floating)
                        io_en_next = 0;
                    end else begin
                        tick_cnt_next = tick_cnt_reg + 1;
                    end
                end
            end
            SYNC_LOW: begin
                if (i_tick) begin
                    if (dht11_io) begin
                        next_state = SYNC_HIGH;
                    end
                end
            end
            SYNC_HIGH: begin
                if (i_tick) begin
                    if (!dht11_io) begin
                        next_state = DATA_SYNC;
                        data_cnt_next = 0;
                        data_next = 0;
                    end
                end
            end
            DATA_SYNC: begin
                if (data_cnt_reg == 40) begin
                    next_state = STOP;
                    tick_cnt_next = 0;
                    data_cnt_next = 0;
                end else if (i_tick) begin
                    if (dht11_io) begin
                        next_state = DATA_DETECT;
                    end
                end
            end
            DATA_DETECT: begin
                if (i_tick) begin
                    if (!dht11_io) begin
                        next_state = DATA_SYNC;
                        tick_cnt_next = 0;
                        data_cnt_next = data_cnt_reg + 1;
                        if (tick_cnt_reg >= 5) begin
                            data_next = {data_reg[38:0], 1'b1};
                        end else begin
                            data_next = {data_reg[38:0], 1'b0};
                        end
                    end else begin
                        tick_cnt_next = tick_cnt_reg + 1;
                    end
                end
            end
            STOP: begin
                if (i_tick) begin
                    if (tick_cnt_reg == 4) begin
                        next_state = IDLE;
                        tick_cnt_next = 0;
                        done_next = 1;
                        if(data_reg[7:0] == (data_reg[39:32] + data_reg[31:24] + data_reg[23:16] + data_reg[15:8])) begin
                            valid_next = 1;
                        end else begin
                            valid_next = 0;
                        end
                    end else begin
                        tick_cnt_next = tick_cnt_reg + 1;
                    end
                end
            end
        endcase
    end

endmodule
