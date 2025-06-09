`timescale 1ns /10ps

module shift_reg #(parameter WIDTH = 7
) (
	input clk,
	input rstn,

	input signed [WIDTH-1:0] data_in,
	output reg signed [WIDTH-1:0] data_out
);

reg signed [WIDTH-1:0] shift_din [32:0];
integer i;
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
	for(i=32 ; i >= 0; i = i- 1) begin
		shift_din[i] <= 0;
	end
end
else begin
	for(i=32 ; i >= 0; i = i- 1) begin
		shift_din[i] <= shift_din[i-1];
	end
	shift_din[0] <= data_in;
end
end

wire [WIDTH-1:0] shift_dout;

//asssign shift_dout = shift_din[32];
assign shift_dout = shift_din[8];

reg [5:0] count;
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		count <= 4'b0;
	end
	else begin
		count <= count + 4'b1;
	end
end

reg [WIDTH-1:0] data_out;
always @(posedge clk or negedge rstn) begin
	if(~rstn) begin
		data_out <= 4'b0;
	end
	else if (count == 6'd10) begin
		data_out <= shift_dout;
	end
end
endmodule
