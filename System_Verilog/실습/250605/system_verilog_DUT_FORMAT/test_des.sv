`timescale 1ns /1ps

program automatic test_des(des_if des_io);

	initial begin
		des_io.reset_n = 0;
		#20 des_io.reset_n = 1;
	end

	initial begin
		for(int i =0; i < 10; i++) begin
			repeat (2) @(if0.cb_0);
			case(i)
				0: if0.cb_0.req <= 1;
				//1: if0.cb_0.req <= 1;
				1: if0.cb_1.req <= 1;
				//2: if0.cb_0.req <= 1;
				2: if0.cb_2.req <= 1;
			endcase
			repeat(2) @(if0.cb_0);
			if0.req <= 0;
		end
		#30 $finish;
	end
endprogram

