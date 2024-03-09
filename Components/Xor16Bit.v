// 16 Bit XOR Module with Structural Verilog by using the Xor1Bit module
module Xor16Bit(output[15:0] result,
					input[15:0] a, 
					input[15:0] b);

	Xor4Bit xor1(result[3:0], a[3:0], b[3:0]);
	Xor4Bit xor2(result[7:4], a[7:4], b[7:4]);
	Xor4Bit xor3(result[11:8], a[11:8], b[11:8]);
	Xor4Bit xor4(result[15:12], a[15:12], b[15:12]);

endmodule 