`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/27 14:41:14
// Design Name: 
// Module Name: fifo_cu
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


module fifo_cu (
    input clk,
    input rst,
    input push,
    input pop,

    output [3:0] w_ptr,
    output [3:0] r_ptr,
    output full,
    output empty
);

    reg [3:0] w_ptr_reg, w_ptr_next, r_ptr_reg, r_ptr_next;
    reg full_reg, full_next, empty_reg, empty_next;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            w_ptr_reg <= 0;
            r_ptr_reg <= 0;
            full_reg  <= 0;
            empty_reg <= 1;
        end else begin
            w_ptr_reg <= w_ptr_next;
            r_ptr_reg <= r_ptr_next;
            full_reg  <= full_next;
            empty_reg <= empty_next;
        end
    end

    always @(*) begin
        w_ptr_next = w_ptr_reg;
        r_ptr_next = r_ptr_reg;
        full_next  = full_reg;
        empty_next = empty_reg;
        // if(push) begin
        //     empty_next = 0;
        //     if(w_ptr_reg == r_ptr_reg) begin
        //         full_next = 1;
        //     end
        //     else begin
        //         w_ptr_next = w_ptr_reg + 1;
        //     end
        // end
        // else if(pop) begin
        //     full_next = 0;
        //     if(w_ptr_reg == r_ptr_reg) begin
        //         empty_next = 1;
        //     end
        //     else begin
        //         r_ptr_next = r_ptr_reg + 1;
        //     end
        // end
        // else if(push & pop) begin
        //     w_ptr_next = w_ptr_reg + 1;
        //     r_ptr_next = r_ptr_reg + 1;
        //     empty_next = empty_reg;
        //     full_next = full_reg;
        // end
        case ({
            pop, push
        })
            2'b01:
            if (!full_reg) begin
                w_ptr_next = w_ptr_reg + 1;
                empty_next = 0;
                if (w_ptr_next == r_ptr_reg) begin
                    full_next = 1;
                end
            end
            2'b10:
            if (!empty) begin
                r_ptr_next = r_ptr_reg + 1;
                full_next  = 0;
                if (w_ptr_reg == r_ptr_next) begin
                    empty_next = 1;
                end
            end
            2'b11:
            begin
                if(empty_reg) begin
                    w_ptr_next = w_ptr_reg + 1;
                    empty_next = 0;
                end
                else if(full_reg) begin
                    r_ptr_next = r_ptr_reg + 1;    
                    full_next = 0;
                end
                else begin
                    w_ptr_next = w_ptr_reg + 1;
                    r_ptr_next = r_ptr_reg + 1;
                end
            end
        endcase
    end

    assign w_ptr = w_ptr_reg;
    assign r_ptr = r_ptr_reg;
    assign full  = full_reg;
    assign empty = empty_reg;
endmodule
