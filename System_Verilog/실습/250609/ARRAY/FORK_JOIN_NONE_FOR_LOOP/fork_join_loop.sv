`timescale 1ns/1ps

program automatic fork_join_loop();
	initial begin
		for(int i =0; i <16 ; i++)begin 
			send(i);
	end	
		wait fork;		// 이거 한번 없애보고 돌리고, 이거 가지고 돌려보기: 2가지 case
		$display("time = %0d", $time);
	end

	task  send(int j);
		fork
			begin
				$display("Driving port %0d", j);
				#1ns;
			end
		join_none
	endtask: send 
//task  send(int j);
		
			//begin
				//$display("Driving port %0d", j);
				//#1ns;
			//end
		
	//endtask: send 
endprogram: fork_join_loop