module dynamic_array (
	
);
	logic [7:0] ID[], array1[] = new[16];
	logic [7:0] data_array[], mdim[][];

	initial begin
	ID = new[100];
	$display("SIZE OF ID = %0d", ID.size());

	data_array = new[ID.size()] (ID);  // 선 메모리 할당
	data_array = ID;					// 후 대입
	$display("SIZE OF data_array = %0d", data_array.size());

	ID = new[ID.size() * 2] (ID);
	$display("SIZE OF ID = %0d", ID.size()); // 메모리상에서 200만큼 할당됨
	ID = data_array;
    $display("SIZE OF ID = %0d", ID.size()); // 실제 메모리 상에서 200개가 잡혀있음. 근데 코드 상에서는 data_array를 대입한 순간 100개의 값이 들어갔을 뿐만 아니라 size도 100으로 바뀜
	data_array.delete();
	$display("SIZE OF data_array = %0d", data_array.size());	
	end
endmodule