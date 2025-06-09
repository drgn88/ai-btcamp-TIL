`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/22 09:20:27
// Design Name: 
// Module Name: uart_tx
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


module uart_tx (
    input clk,
    input rst,
    input baud_tick,
    input start_trigger,
    input [7:0] i_data,

    //output reg tx_data
    output tx_data
);

    localparam IDLE = 4'd0;
    localparam START = 4'd1;
    localparam DATA_0 = 4'd2;
    localparam DATA_1 = 4'd3;
    localparam DATA_2 = 4'd4;
    localparam DATA_3 = 4'd5;
    localparam DATA_4 = 4'd6;
    localparam DATA_5 = 4'd7;
    localparam DATA_6 = 4'd8;
    localparam DATA_7 = 4'd9;
    localparam STOP = 4'd10;
    localparam WAIT = 4'd11;

    reg [3:0] state, next_state;
    

    // //내방식
    // reg start_flag;
    // //state register
    // always @(posedge clk or posedge rst) begin
    //     if(rst) begin
    //         state <= 0;
    //     end
    //     begin
    //         state <= next_state;
    //     end
    // end


    // //Next state logic
    // always @(*) begin
    //     case (state)
    //         IDLE: if(start_trigger) begin
    //             next_state = IDLE;
    //              start_flag = 1;
    //         end 
    //          else if(start_flag && baud_tick) begin
    //             next_state  = START;
    //             start_flag = 0;
    //         end
    //         else begin
    //             next_state = IDLE;
    //         end
    //         START: if(baud_tick) begin
    //             next_state = DATA_0;
    //         end else begin
    //             next_state = START;
    //         end
    //         DATA_0: if(baud_tick) begin
    //             next_state = DATA_1;
    //         end else begin
    //             next_state = DATA_0;
    //         end
    //         DATA_1: if(baud_tick) begin
    //             next_state = DATA_2;
    //         end else begin
    //             next_state = DATA_1;
    //         end
    //         DATA_2: if(baud_tick) begin
    //             next_state = DATA_3;
    //         end else begin
    //             next_state = DATA_2;
    //         end
    //         DATA_3: if(baud_tick) begin
    //             next_state = DATA_4;
    //         end else begin
    //             next_state = DATA_3;
    //         end
    //         DATA_4: if(baud_tick) begin
    //             next_state = DATA_5;
    //         end else begin
    //             next_state = DATA_4;
    //         end
    //         DATA_5: if(baud_tick) begin
    //             next_state = DATA_6;
    //         end else begin
    //             next_state = DATA_5;
    //         end
    //         DATA_6: if(baud_tick) begin
    //             next_state = DATA_7;
    //         end else begin
    //             next_state = DATA_6;
    //         end
    //         DATA_7: if(baud_tick) begin
    //             next_state = STOP;
    //         end else begin
    //             next_state = DATA_7;
    //         end
    //         STOP: if(baud_tick) begin
    //             next_state = IDLE;
    //         end else begin
    //             next_state = STOP;
    //         end
    //         default: next_state = IDLE;
    //     endcase
    // end

    // // //Output logic
    // always @(*) begin
    //     case (state)
    //         IDLE: tx_data = 1;
    //         START: tx_data = 0;
    //         DATA_0: tx_data = i_data[0];
    //         DATA_1: tx_data = i_data[1];
    //         DATA_2: tx_data = i_data[2];
    //         DATA_3: tx_data = i_data[3];
    //         DATA_4: tx_data = i_data[4];
    //         DATA_5: tx_data = i_data[5];
    //         DATA_6: tx_data = i_data[6];
    //         DATA_7: tx_data = i_data[7];
    //         STOP: tx_data = 1;
    //         default: tx_data = 1;
    //     endcase
    // end

    // 교수님 방식

    reg tx_reg, tx_next;

    //state register
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 0;
            tx_reg <= 1;
            
        end
        begin
            state <= next_state;
            tx_reg <= tx_next;
            
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
                next_state = DATA_0;
                tx_next = 0;
            end else begin
                next_state = START;
                tx_next = 1;
            end
            DATA_0:
            if (baud_tick) begin
                next_state = DATA_1;
                tx_next = i_data[0];
            end else begin
                next_state = DATA_0;
                tx_next = 0;
            end
            DATA_1:
            if (baud_tick) begin
                next_state = DATA_2;
                tx_next = i_data[1];
            end else begin
                next_state = DATA_1;
                tx_next = i_data[0];
            end
            DATA_2:
            if (baud_tick) begin
                next_state = DATA_3;
                tx_next = i_data[2];
            end else begin
                next_state = DATA_2;
                tx_next = i_data[1];
            end
            DATA_3:
            if (baud_tick) begin
                next_state = DATA_4;
                tx_next = i_data[3];
            end else begin
                next_state = DATA_3;
                tx_next = i_data[2];
            end
            DATA_4:
            if (baud_tick) begin
                next_state = DATA_5;
                tx_next = i_data[4];
            end else begin
                next_state = DATA_4;
                tx_next = i_data[3];
            end
            DATA_5:
            if (baud_tick) begin
                next_state = DATA_6;
                tx_next = i_data[5];
            end else begin
                next_state = DATA_5;
                tx_next = i_data[4];
            end
            DATA_6:
            if (baud_tick) begin
                next_state = DATA_7;
                tx_next = i_data[6];
            end else begin
                next_state = DATA_6;
                tx_next = i_data[5];
            end
            DATA_7:
            if (baud_tick) begin
                next_state = STOP;
                tx_next = i_data[7];
            end else begin
                next_state = DATA_7;
                tx_next = i_data[6];
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
            end
        endcase
    end

    assign tx_data = tx_reg;
endmodule
