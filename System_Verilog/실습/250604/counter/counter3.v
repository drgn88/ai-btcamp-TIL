`timescale 1ns/1ps

module counter3(
	input clk, rst,
	output [3:0] cnt1, cnt2
);

reg [3:0] count1, count2;

assign cnt1 = count1;
assign cnt2 = count2;

always @(posedge clk or posedge rst) begin
	if(rst) begin
		count1 <= 4'b0;
		count2 <= 4'b0;
	end
	else begin
		if(count1 == 4'd11) begin
			count1 <= 4'b0;
			if(count2 == 4'd14) begin
				count2 <= 4'b0;
			end
			else begin
				count2 <= count2 + 4'b1;
			end
		end
		else begin
			count1 <= count1 + 4'b1;
		end
	end
end
endmodule
