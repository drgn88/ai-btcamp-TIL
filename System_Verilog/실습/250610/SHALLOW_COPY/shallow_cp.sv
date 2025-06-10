`timescale 1ns/10ps

program automatic shallow_cp (
	
);
	class abc;
		int a;	
	endclass //abc

	initial begin
		abc o1 = new();
		abc o2 = new();

		o1.a = 5;
		o2.a = 50;

		$display("A: %0d %0d", o1.a, o2.a);
		o2 = o1;
		o1.a = 500;
		$display("B: %0d %0d", o1.a, o2.a);
	end	
endprogram: shallow_cp