`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/06 10:32:04
// Design Name: 
// Module Name: timer_cu
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


module timer_cu(
    input clk,
    input rstn,
    input sw1,
    // input sw2,

    output up_mode,
    output down_mode
    );

    // localparam IDLE = 0;
    localparam UP = 0;
    localparam DOWN = 1;

    reg up_reg, up_next;
    reg down_reg, down_next;
    reg state, n_state;

    assign up_mode = up_reg;
    assign down_mode = down_reg;

    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            up_reg <= 0;
            down_reg <= 0;
            state <= 0;
        end
        else begin
            up_reg <= up_next;
            down_reg <= down_next;
            state <= n_state;
        end
    end

    always @(*) begin
        n_state = state;
        up_next = up_reg;
        down_next = down_reg;
        case (state)
           UP : begin
                up_next = 1;
                down_next = 0;
                if(sw1) begin
                    n_state = DOWN;
                end
                else begin
                    n_state = UP;
                end
           end
           DOWN : begin
                up_next = 0;
                down_next = 1;
                if(!sw1) begin
                    n_state = UP;
                end
                else begin
                    n_state = DOWN;
                end
           end
        endcase
    end

endmodule
