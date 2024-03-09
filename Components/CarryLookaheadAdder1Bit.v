module CarryLookaheadAdder1Bit(output sum, input a, b, input c_in);
	// base of 32-Bit cla (basic adder, not any logic)
	xor xor1(aXorB, a, b);
	xor xor2(sum, aXorB, c_in);
	
endmodule 
