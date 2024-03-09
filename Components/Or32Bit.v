// 32 Bit OR Module with Structural Verilog by using the Or16Bit module
module Or32Bit(output[32:0] result,
					input[32:0] a, 
					input[32:0] b);

	Or16Bit or1(result[15:0], a[15:0], b[15:0]);
	Or16Bit or2(result[31:16], a[31:16], b[31:16]);

endmodule 