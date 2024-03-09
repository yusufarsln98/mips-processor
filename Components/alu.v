module alu(
	output[31:0] alu_result,
	output zero_bit, // to get carry out bit of adder
	input[31:0] alu_src1,
	input[31:0] alu_src2,
	input[2:0] alu_ctr
	);
					 
	wire[31:0] andResult;
	wire[31:0] orResult;
	wire[31:0] xorResult;
	wire[31:0] norResult;
	wire[31:0] sltResult;
	wire[31:0] sltReverseResult; // to obtain zero bit
	wire[31:0] addResult;
	wire[31:0] subResult;
	wire[31:0] ignore;
	wire c_out; // ignore c_out (used in previous project)
	wire not_zero_bit;
	
	And32Bit and32Bit(andResult, alu_src1, alu_src2); 				// 000
	Or32Bit or32Bit(orResult, alu_src1, alu_src2); 					// 001
	Xor32Bit xor32Bit(xorResult, alu_src1, alu_src2); 				// 010
	Nor32Bit nor32Bit(norResult, alu_src1, alu_src2); 				// 011
	SetLessThen32Bit setLessThen32Bit(sltResult, alu_src1, alu_src2); // 100
	SetLessThen32Bit setLessThen32Bit2(sltReverseResult, alu_src2, alu_src1); // 100
	CarryLookaheadAdder32Bit carryLookaheadAdder32Bit(addResult, c_out, alu_src1, alu_src2, 0); // 101
	Subtractor32Bit subtractor32Bit(subResult, alu_src1, alu_src2); 	// 110

	
	Mux8x1_32Bit mux8x1_32Bit(alu_result, 
							  andResult, 
							  orResult, 
							  xorResult, 
							  norResult, 
							  sltResult, 
							  addResult, 
							  subResult, 
							  ignore, 
							  alu_ctr);


	// zero bit
	xor xor1(not_zero_bit, sltResult[0], sltReverseResult[0]);
	not not1(zero_bit, not_zero_bit);

endmodule 