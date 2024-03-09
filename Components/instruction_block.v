module instruction_block(
	output reg [31:0] instruction,
	input [31:0] pc);

	// reg [31:0] instructions [1023:0];
	reg [7:0] instructions [4095:0];

	always @(*) begin
		$readmemb("instructions.mem", instructions);
		// instruction = instructions[pc];
		// read 4 bytes from instruction memory
		instruction = {instructions[pc], instructions[pc+1], instructions[pc+2], instructions[pc+3]};
	end
endmodule 