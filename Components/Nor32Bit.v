// 32 Bit NOR Module with Structural Verilog by using the Nor16Bit module
module Nor32Bit(output[32:0] result,
					input[32:0] a, 
					input[32:0] b);

	Nor16Bit nor1(result[15:0], a[15:0], b[15:0]);
	Nor16Bit nor2(result[31:16], a[31:16], b[31:16]);

endmodule 