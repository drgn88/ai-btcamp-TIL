`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/05/13 11:30:35
// Design Name: 
// Module Name: clk_div_test
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


module clk_div_test (
    input clk,
    input rst,

    output clk_div_2,
    output clk_div_3,
    output clk_div_4,
    output clk_div_8
);
    //num == division rate
    //localparam num = ;

    reg [2:0] r_cnt, r_cnt_neg;

    //assign clk_div_2 = r_cnt[0];
    //assign clk_div_4 = r_cnt[1];
    //assign clk_div_8 = r_cnt[2];

    assign clk_div_3 = (r_cnt_neg == 2) | (r_cnt == 2);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            r_cnt <= 0;
        end
        else if(r_cnt == 2) begin
            r_cnt <= 0;
        end 
        else begin
            r_cnt <= r_cnt + 1;
        end
    end

    always @(negedge clk or posedge rst) begin
        if (rst) begin
            r_cnt_neg <= 0;
        end
        else if(r_cnt_neg == 2) begin
            r_cnt_neg <= 0;
        end  
        else begin
            r_cnt_neg <= r_cnt_neg + 1;
        end
    end
endmodule
