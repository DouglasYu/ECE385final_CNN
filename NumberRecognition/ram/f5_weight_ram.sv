module f5_weight_ram(
	input logic 						Clk,
	input logic [13:0]				addr,
	output logic signed [31:0] 	read_data
);

	logic signed [31:0] mem [480];
	
	initial
	begin
		$readmemb("D:/Projects/ECE385Labs/final/final_code/weights/tiny_f5/f5_weight_new.txt", mem);
	end
	
	always_ff@(negedge Clk)
	begin
		read_data <= mem[addr];
	end

endmodule