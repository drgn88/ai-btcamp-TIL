module fixed_size_array (
	
);
	integer numbers[5];
	int b[2] = '{3, 7};

	bit [31:0] c[2][3] = '{{3, 7, 1}, {5, 1, 9}};
	byte d[7][2] = '{default: -1};

	bit [31:0] a[2][3] = c;

	initial begin
	for(int i = 0; i<$dimensions(a); i++) begin
		$display($size(a, i+1));
	end	
	end

endmodule