// 32 Bit XOR Module with Structural Verilog by using the Xor16Bit module
module Xor32Bit(output[32:0] result,
					input[32:0] a, 
					input[32:0] b);

	Xor16Bit xor1(result[15:0], a[15:0], b[15:0]);
	Xor16Bit xor2(result[31:16], a[31:16], b[31:16]);

endmodule 