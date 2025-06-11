`timescale 1ns/10ps

program semaphore_test;

semaphore key;

initial begin
	key = new(1);
	fork
		personA ();
		personB ();
		#25 personA ();
	join_none
	wait fork;
end

task getRoom (bit [1:0] id);
	key.get(1);
	$display("[%0t] get!!!", $time);
endtask //

task putRoom (bit [1:0] id);
	key.put(1);
	$display("[%0t] put...", $time);
endtask

task personA ();
	getRoom (1);
	#20 putRoom(1);
endtask

task personB ();
	#5 getRoom (2);
	#10 putRoom(2);
endtask
endprogram