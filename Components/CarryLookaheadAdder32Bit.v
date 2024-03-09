module CarryLookaheadAdder32Bit(output [31:0] sum, output c_out, input [31:0] a, b, input c_in);
    // This is the SECOND LEVEL of the carry lookahead.

    wire [1:0] cll; // to result of Carry Lookahead Logic, which first index is c_in for second 16 adder and second index is c_out

    CarryLookaheadLogic32Bit carryLookaheadLogic32Bit(cll, a, b, c_in);
    
    CarryLookaheadAdder16Bit carryLookaheadAdder16Bit1(sum[15:0], a[15:0], b[15:0], c_in);
    CarryLookaheadAdder16Bit carryLookaheadAdder16Bit2(sum[31:16], a[31:16], b[31:16], cll[0]);
	 
    or or1(c_out, cll[1], 1'b0); // to return calculated carry out bit.
    
endmodule 