program tb_dpic_export;

export "DPI-C" function addition_sv;
import "DPI-C" context function void c_caller();

function void addition_sv(int a, b);
	$display("Addition of %0d and %0d is %d\n", a, b, a+b);
endfunction

initial begin
	c_caller();
end
endprogram