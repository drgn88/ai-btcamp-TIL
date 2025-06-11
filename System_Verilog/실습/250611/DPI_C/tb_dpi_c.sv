`timescale 1ns/10ps

program tb_dpi_c;

	import "DPI-C" context function void addition(input int a, int b);

	initial begin
		$display("Before add function call");
		addition(4,5);
		$display("After add function call");
	end

endprogram