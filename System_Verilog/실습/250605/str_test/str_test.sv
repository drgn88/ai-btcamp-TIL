module str_test (
	
);
	string name, s = "Now is the time";

	initial begin
		for(int i = 0; i < 4 ; i++) begin
			name = $sformatf("string%0d", i);
			$display("%s, upper: %s", name, name.toupper());
		end
		s.putc(s.len()-1,s.getc(5));
		$display(s.substr(s.len()-4,s.len()-1));
	end
endmodule