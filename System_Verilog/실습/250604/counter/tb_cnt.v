`timescale 1ns/1ps

module tb_cnt();

reg clk, rst;
wire [3:0] cnt1, cnt2, cnt3_1, cnt3_2;

initial begin
	clk <= 1'b1;
	rst <= 1'b0;
	#5
	rst <= 1'b1;
	#5
	rst <= 1'b0;
	#400
	$finish;
end

counter1 TEST1(clk,rst,cnt1);
counter2 TEST2(clk, rst, cnt2);
counter3 TEST3(clk, rst, cnt3_1, cnt3_2);

always #5 clk <= ~clk;

endmodule
