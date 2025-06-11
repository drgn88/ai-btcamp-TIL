`timescale 1ns/10ps

class A;
	protected int a;
	function int get_a();
		get_a = a;
	endfunction
	function new(int b);
		a = b;
	endfunction
endclass: A

class B extends A;
	protected int b = 1000;
	task  print_a();
		$display("a is %d", get_a());	
	endtask : print_a//print_aon new(int b);
	function new(int b);
		super.new(b);
	endfunction
endclass: B

class C extends B;
function new(int c);
	super.new(c);
	a = c;
endfunction
endclass: C

program automatic class_extend;
	initial begin
	C test_c = new(10);
	test_c.print_a();
	end

	initial begin
		B test_b = new(1000);
		test_b.print_a();
	end
endprogram : class_extend