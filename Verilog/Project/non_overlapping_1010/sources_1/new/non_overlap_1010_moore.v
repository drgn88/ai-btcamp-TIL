`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/15 12:33:15
// Design Name: 
// Module Name: non_overlap_1010_moore
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


module non_overlap_1010_moore (
    input clk,
    input rst,
    input din,

    output dout
);

    parameter A = 3'd0;
    parameter B = 3'd1;
    parameter C = 3'd2;
    parameter D = 3'd3;
    parameter E = 3'd4;

    reg [2:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= A;
        end
        else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            A : if(din) begin
                next_state = B;
            end 
            else begin
                next_state = A;
            end
            B : if(!din) begin
                next_state = C;
            end 
            else begin
                next_state = B;
            end
            C : if(din) begin
                next_state = D;
            end 
            else begin
                next_state = A;
            end
            D : if(!din) begin
                next_state = E;
            end 
            else begin
                next_state = B;
            end
            default: next_state = A;
        endcase
    end

    assign dout = (state == E) ? 1 : 0;
endmodule
