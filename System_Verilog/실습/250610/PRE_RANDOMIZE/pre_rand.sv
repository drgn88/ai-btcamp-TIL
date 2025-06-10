`timescale 1ns/10ps

class Node;
	randc int x, y, z;
	
	constraint Limit1 {
		x inside {[0:16]};
		y inside {[23:41]};
		z < y; 
		z > x;
	}	
endclass : Node


program automatic pre_rand (
	
);
	initial begin
	Node obj1 = new();
	obj1.x = 0;
	obj1.x.rand_mode(0);
	if(!obj1.randomize()) $finish;
	$display("obj1.x = %0d", obj1.x);
	$display("obj1.y = %0d", obj1.y);
	$display("obj1.z = %0d", obj1.z);
	end
endprogram : pre_rand