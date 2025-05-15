`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/15 11:25:42
// Design Name: 
// Module Name: mealy_fsm
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


module mealy_fsm(
    input clk,
    input rst,
    input din,

    output reg dout
    );

    parameter START = 3'd0;
    parameter rd0_once = 3'd1;
    parameter rd0_twice = 3'd2;
    parameter rd1_once = 3'd3;
    parameter rd1_twice = 3'd4;

    reg [3:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= START;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            START : if(din == 1) begin
                next_state = rd1_once;
            end  
            else begin
                next_state = rd0_once;
            end
            rd0_once : if(din == 0) begin
                next_state = rd0_twice;
            end
            else begin
                next_state = rd1_once;
            end
            rd0_twice : if(din) begin
                next_state = rd1_once;
            end
            else begin
                next_state = rd0_twice;
            end
            rd1_once : if(din) begin
                next_state = rd1_twice;
            end
            else begin
                next_state = rd0_once;
            end
            rd1_twice : if(din) begin
                next_state = rd1_twice;
            end
            else begin
                next_state = rd0_once;
            end
            default: next_state = START;
        endcase
    end

    always @(*) begin
        case (state)
            rd0_twice : if(!din) begin
                dout = 1;
            end
            else begin
                dout = 0;
            end
            rd1_twice : if(din) begin
                dout = 1;
            end
            else begin
                dout = 0;
            end
            default: dout = 0;
        endcase
    end

    // always @(*) begin
    //     case (state)
    //         START : dout = 0;
    //         rd0_once : dout = 0;
    //         rd0_twice : dout = 1;
    //         rd1_once : dout = 0;
    //         rd1_twice : dout = 1;
    //         default: dout = 0;
    //     endcase
    // end

endmodule
