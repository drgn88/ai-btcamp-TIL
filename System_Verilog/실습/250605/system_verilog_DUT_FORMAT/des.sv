`timescale 1ns / 1ps

module des(
	input logic reset_n,
	input logic clk,
	input logic req,
	output logic gnt
);

always @(posedge clk or negedge reset_n) begin
	if(~reset_n)
		gnt <= 0;
	else if (req)
		gnt <= 1;
	else
		gnt <= 0;
	end

	endmodule : des
