`timescale 1ns/10ps

module automatic n_en_cond (
	
);
	class abc;
		rand int a;
		constraint c1 {a inside {[1:4]};}
		constraint c2 {a inside {[5:8]};}
	endclass

	initial begin
		abc o1 = new();
		o1.randomize();
		$display("test: o1 = %p", o1);
	end
endmodule: n_en_cond