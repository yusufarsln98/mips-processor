module Mux8x1_4Bit(output[3:0] result, 
						 input[3:0] a, b, c, d, e, f, g, h, 
						 input[2:0] op);
						 
	// This is a 8x1 Mux that takes 8 four-bit inputs and 3-bit op signal, returns
	// the result based on the op signal.

	Mux8x1_1Bit mux1(result[0], a[0], b[0], c[0], d[0], e[0], f[0], g[0], h[0], op);
	Mux8x1_1Bit mux2(result[1], a[1], b[1], c[1], d[1], e[1], f[1], g[1], h[1], op);
	Mux8x1_1Bit mux3(result[2], a[2], b[2], c[2], d[2], e[2], f[2], g[2], h[2], op);
	Mux8x1_1Bit mux4(result[3], a[3], b[3], c[3], d[3], e[3], f[3], g[3], h[3], op);

endmodule

