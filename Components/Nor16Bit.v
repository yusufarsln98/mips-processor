// 16 Bit NOR Module with Structural Verilog by using the Nor1Bit module
module Nor16Bit(output[15:0] result,
					input[15:0] a, 
					input[15:0] b);

	Nor4Bit nor1(result[3:0], a[3:0], b[3:0]);
	Nor4Bit nor2(result[7:4], a[7:4], b[7:4]);
	Nor4Bit nor3(result[11:8], a[11:8], b[11:8]);
	Nor4Bit nor4(result[15:12], a[15:12], b[15:12]);

endmodule 