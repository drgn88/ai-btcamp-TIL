`timescale 1ns/10ps

typedef class Packet;

program automatic static_member (
	
);
	initial begin
		Packet pkt0 = new();
		Packet pkt1 = new();
		$display("pkt0 id is: %0d", pkt0.id);
		$display("pkt1 id is: %0d", pkt1.id);
		$display("count: %0d", Packet::count);
	end
endprogram : static_member

class Packet;
	static int count = 0;
	int id;
	static function int get_count();
		return count;
	endfunction
	function new();
		this.id = count++;
	endfunction
endclass : Packet