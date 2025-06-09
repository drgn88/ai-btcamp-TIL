`timescale 1ns/ 10ps

module tb_shift_reg();

reg clk, rstn;
reg [6:0] data_in;
wire [6:0] data_out;

initial begin
	clk <= 1'b1;
	rstn <=1'b0;
	#15 rstn <= 1'b1;
	#400 $finish;
end

initial begin
	data_in <= 7'd0;
	//#20 data_in <= 7'd3; //Abnormal
	#25 data_in <= 7'd3; //Normal
	#10 data_in <= 7'd1;
	#10 data_in <= 7'd5;
	#10 data_in <= 7'd11;
	#10 data_in <= 7'd15;
	#10 data_in <= 7'd21;
	#10 data_in <= 7'd32;
	#10 data_in <= 7'd8;
	#10 data_in <= 7'd11;
	#10 data_in <= 7'd16;
	#10 data_in <= 7'd21;
	#10 data_in <= 7'd10;
	#10 data_in <= 7'd0;
	#10 data_in <= 7'd9;
	#10 data_in <= 7'd10;
end

shift_reg #(.WIDTH(7)) i_shift_reg(
	.clk(clk),
	.rstn(rstn),
	.data_in(data_in),
	.data_out(data_out));

always #5 clk <= ~clk;

endmodule
