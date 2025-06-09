`timescale 1ns /1ps

interface des_if (input bit clk);
	logic reset_n;
	logic gnt;
	logic req;

	clocking cb_0 @(posedge clk);
		output #0 req;
	endclocking

	clocking cb_1 @(posedge clk);
		output #2 req;
	endclocking

	clocking cb_2 @(posedge clk);
		output #5 req;
	endclocking

endinterface
