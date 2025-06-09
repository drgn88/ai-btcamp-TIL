module enum_test (
	
);
	typedef enum  {IDLE=1, TEST, START} state_e;

	//state_e current, next = IDLE;
	state_e current=START, next = IDLE;

	initial begin
		//$display("current=%d, next=%s", current, next.name()); //0,IDLE
		$display("current=%d, next=%s", current, next); //3, 1
		$display("next=%p", next); //IDLE
	end
endmodule