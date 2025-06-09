program diff_type_assign (

);
 bit[31:0] count;
 logic [31:0] Count = 'x;
 initial begin
	count = Count;
	$display("Count = %0x count = %0d", Count, count);
 end	
endprogram : diff_type_assign