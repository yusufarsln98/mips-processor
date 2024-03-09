module SetLessThen32Bit(output [31:0] result, input [31:0] a, b);

	wire[31:0] subResult;

	Subtractor32Bit subtractor32Bit(subResult, a, b);

	and and1(result[0], subResult[31], 1'b1); // to save result 
	// other bits are zero
	and and2(result[1], 1'b0, 1'b0);
	and and3(result[2], 1'b0, 1'b0);
	and and4(result[3], 1'b0, 1'b0);
	and and5(result[4], 1'b0, 1'b0);
	and and6(result[5], 1'b0, 1'b0);
	and and7(result[6], 1'b0, 1'b0);
	and and8(result[7], 1'b0, 1'b0);
	and and9(result[8], 1'b0, 1'b0);
	and and10(result[9], 1'b0, 1'b0);
	and and11(result[10], 1'b0, 1'b0);
	and and12(result[11], 1'b0, 1'b0);
	and and13(result[12], 1'b0, 1'b0);
	and and14(result[13], 1'b0, 1'b0);
	and and15(result[14], 1'b0, 1'b0);
	and and16(result[15], 1'b0, 1'b0);
	and and17(result[16], 1'b0, 1'b0);
	and and18(result[17], 1'b0, 1'b0);
	and and19(result[18], 1'b0, 1'b0);
	and and20(result[19], 1'b0, 1'b0);
	and and21(result[20], 1'b0, 1'b0);
	and and22(result[21], 1'b0, 1'b0);
	and and23(result[22], 1'b0, 1'b0);
	and and24(result[23], 1'b0, 1'b0);
	and and25(result[24], 1'b0, 1'b0);
	and and26(result[25], 1'b0, 1'b0);
	and and27(result[26], 1'b0, 1'b0);
	and and28(result[27], 1'b0, 1'b0);
	and and29(result[28], 1'b0, 1'b0);
	and and30(result[29], 1'b0, 1'b0);
	and and31(result[30], 1'b0, 1'b0);
	and and32(result[31], 1'b0, 1'b0);
	
	
endmodule
