module adder_32bit_plus_4(
    output [31:0] sum, 
    input [31:0] a);

    wire c_out;

    CarryLookaheadAdder32Bit adder(
        .sum(sum),
        .c_out(c_out),
        .a(a),
        .b(32'b00000000000000000000000000000100),
        .c_in(1'b0)
    );

endmodule 