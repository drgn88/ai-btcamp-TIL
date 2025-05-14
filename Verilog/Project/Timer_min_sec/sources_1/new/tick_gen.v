`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 17:30:05
// Design Name: 
// Module Name: tick_gen
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


module tick_gen (
    input clk_div_1hz,
    input clk,
    input rst,

    output tick_gen
);

    localparam S0 = 2'b0;
    localparam S1 = 1'b1;

    reg state, next_state;

    // state reg
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end

    //next state logic
    always @(*) begin
        case (state)
            S0:
            if (clk_div_1hz == 1) begin
                next_state = S1;
            end else begin
                next_state = S0;
            end
            S1:
            if (clk_div_1hz == 0) begin
                next_state = S0;
            end else begin
                next_state = S1;
            end
        endcase
    end

    assign tick_gen = ((state == S0) && (clk_div_1hz == 1)) ? 1 : 0;

endmodule
