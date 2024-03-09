// 16 Bit OR Module with Structural Verilog by using the Or1Bit module
module Or16Bit(output[15:0] result,
					input[15:0] a, 
					input[15:0] b);

	Or4Bit or1(result[3:0], a[3:0], b[3:0]);
	Or4Bit or2(result[7:4], a[7:4], b[7:4]);
	Or4Bit or3(result[11:8], a[11:8], b[11:8]);
	Or4Bit or4(result[15:12], a[15:12], b[15:12]);

endmodule 