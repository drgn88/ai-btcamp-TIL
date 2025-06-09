`timescale 1ns/1ps

program automatic fork_join_repeat_16();
	initial begin
		for(int i =0; i <16 ; i++)begin 
			fork
				int index = i;
				//$display("index = %0d", index);
				//$display("i = %0d", i);
				//$display("index = %0d", i);
				send(index);
			join_none
	end	
		wait fork;
		//$display("index = %0d", i);
		$display("time = %0d", $time);
	end

	task  send(int j);
			begin
				$display("Driving port %0d", j);
				#1ns;
			end
	endtask: send 
//task  send(int j);
		
			//begin
				//$display("Driving port %0d", j);
				//#1ns;
			//end
		
	//endtask: send 
endprogram: fork_join_repeat_16