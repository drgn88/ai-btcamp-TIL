`timescale 1ns/1ps

module counter1(
	input clk, rst,
	output [3:0] cnt
);

reg [3:0] count;

assign cnt = count;

always @(posedge clk or posedge rst) begin
	if(rst) begin
		count <= 4'b0;
	end
	else begin
		count <= count + 4'b1;
	end
end

endmodule
