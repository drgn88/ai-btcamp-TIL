`timescale 1ns/10ps

class Config;
	rand bit[7:0] addrs[10];
	rand bit drivers_in_use[16];
	rand int num_of_drivers, one_addr;
		constraint limit {
			num_of_drivers inside {[1:16]};
			drivers_in_use.sum() with (int'(item)) == num_of_drivers;
			foreach(addrs[idx]) (idx > 0) -> addrs[idx] > addrs[idx-1];
			one_addr inside addrs;
		}

		function display();
			$display("num_of_drivers = %0d", num_of_drivers);	
			$display("drivers_in_use = %p", drivers_in_use);	
			$display("addrs = %p", addrs);
			$display("one_addr = %p", one_addr);
		endfunction	
endclass : Config


program automatic array_const (
	
);
	initial begin
	Config pkt1 = new();
	if(!pkt1.randomize()) $finish;
	pkt1.display();
	end
endprogram