module Mux8x1_1Bit(output result, 
						 input a, b, c, d, e, f, g, h, 
						 input[2:0] op);
	
	// This is a 8x1 Mux that takes 8 one-bit inputs and 3-bit op signal, returns
	// the result based on the op signal.

	not not0(notOp0, op[0]);
	not not1(notOp1, op[1]);
	not not2(notOp2, op[2]);

	and and1(w1, a, notOp0, notOp1, notOp2);
	and and2(w2, b, op[0], notOp1, notOp2);
	and and3(w3, c, notOp0, op[1], notOp2);
	and and4(w4, d, op[0], op[1], notOp2);
	and and5(w5, e, notOp0, notOp1, op[2]);
	and and6(w6, f, op[0], notOp1, op[2]);
	and and7(w7, g, notOp0, op[1], op[2]);
	and and8(w8, h, op[0], op[1], op[2]);

	or or1(result, w1, w2, w3, w4, w5, w6, w7, w8);

endmodule 
