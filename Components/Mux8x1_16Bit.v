module Mux8x1_16Bit(output [15:0] result, 
						  input [15:0] a, b, c, d, e, f, g, h, 
						  input[2:0] op);
						  
	// This is a 8x1 Mux that takes 8 16-bit inputs and 3-bit op signal, returns
	// the result based on the op signal.

	Mux8x1_4Bit mux1(result[3:0], a[3:0], b[3:0], c[3:0], d[3:0], e[3:0], f[3:0], g[3:0], h[3:0], op);
	Mux8x1_4Bit mux2(result[7:4], a[7:4], b[7:4], c[7:4], d[7:4], e[7:4], f[7:4], g[7:4], h[7:4], op);
	Mux8x1_4Bit mux3(result[11:8], a[11:8], b[11:8], c[11:8], d[11:8], e[11:8], f[11:8], g[11:8], h[11:8], op);
	Mux8x1_4Bit mux4(result[15:12], a[15:12], b[15:12], c[15:12], d[15:12], e[15:12], f[15:12], g[15:12], h[15:12], op);

endmodule

