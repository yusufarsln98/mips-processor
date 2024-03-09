// 32 Bit AND Module with Structural Verilog by using the And16Bit module
module And32Bit(output[32:0] result,
					input[32:0] a, 
					input[32:0] b);

	And16Bit and1(result[15:0], a[15:0], b[15:0]);
	And16Bit and2(result[31:16], a[31:16], b[31:16]);

endmodule 