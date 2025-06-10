class Packet;
	randc bit[3:0] sa, da;
	rand bit[7:0] payload[] = new[5];

	function void display();
		$display("sa = %0d, da = %0d", sa, da);
		$display("size of payload array = %0d", payload.size());
		$display("payload[] = %p", payload);
	endfunction	: display
endclass : Packet

program automatic random_array(
	
);
	initial begin
	Packet pkt = new();
	if(!pkt.randomize()) $finish;
	pkt.display();
	end
endprogram : random_array 