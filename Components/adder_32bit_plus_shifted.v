// just an adder for abstract adder in mips module
module adder_32bit_plus_shifted(
    output [31:0] sum, 
    input [31:0] a,
    input [31:0] shifted);

    wire c_out;

    CarryLookaheadAdder32Bit adder(
        .sum(sum),
        .c_out(c_out),
        .a(a),
        .b(shifted),
        .c_in(1'b0)
    );

endmodule 