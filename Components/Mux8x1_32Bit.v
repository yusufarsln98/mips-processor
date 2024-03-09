module Mux8x1_32Bit(output[31:0] result, 
						  input[31:0] a, b, c, d, e, f, g, h, 
						  input[2:0] op);
						  
	// This is a 8x1 Mux that takes 8 32-bit inputs and 3-bit op signal, returns
	// the result based on the op signal.

	Mux8x1_16Bit mux1(result[15:0], a[15:0], b[15:0], c[15:0], d[15:0], e[15:0], f[15:0], g[15:0], h[15:0], op);
	Mux8x1_16Bit mux2(result[31:16], a[31:16], b[31:16], c[31:16], d[31:16], e[31:16], f[31:16], g[31:16], h[31:16], op);

endmodule
