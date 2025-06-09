module find_function (
	
);
	
endmodule

program automatic test;

	bit[7:0] SQ_array[$] = {2,1,8,3,5};
	bit[7:0] SQ[$];
	int idx[$];

	initial begin
		SQ = SQ_array.find() with (item > 3);
		
			$display(SQ);
		
		idx = SQ_array.find_index(addr) with (addr > 3);
		
			$display(idx);
		
	end
endprogram