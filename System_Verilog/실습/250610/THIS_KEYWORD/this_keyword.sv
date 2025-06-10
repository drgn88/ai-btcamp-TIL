`timescale 1ns/10ps

program this_keyword (
	
);
	class abc;
		int a = 10;
		function new(int a);
		this.a = a;
		endfunction
	endclass	

	abc o1;

	initial begin
		o1 = new(5);
		$display("a = %0d", o1.a);
	end
endprogram: this_keyword