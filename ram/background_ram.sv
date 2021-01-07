module background_ram(
	input logic 						Clk,
	input logic [13:0]				addr,
	output logic signed [31:0] 	read_data
);

	logic [31:0] mem [9600];
	
	initial
	begin
		$readmemb("D:/Projects/ECE385Labs/final/final_code/weights/background2.txt", mem);
	end
	
	always_ff@(negedge Clk)
	begin
		read_data <= mem[addr];
	end

endmodule
