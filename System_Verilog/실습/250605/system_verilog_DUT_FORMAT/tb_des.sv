`timescale 1ns /1ps

module tb_des;

bit clk;

initial begin
	clk <= 0;
end

always #10 clk = ~clk;

des_if if0 (.clk(clk));

test_des test_des0(if0);

des des0 (.reset_n(if0.reset_n),
	.clk(clk),
	.req(if0.req),
	.gnt(if0.gnt));

endmodule
