module CarryLookaheadAdder4Bit(output [3:0] sum, output c_out, input [3:0] a, b, input c_in);
    // This is the FIRST LEVEL of the carry lookahead adder for 32-bit adder

    // pi = ai xor bi
    // gi = ai and bi

    wire [3:0] p;
    wire [3:0] g;

    Xor4Bit xor4Bit(p, a, b);
    And4Bit and4Bit(g, a, b);

    // c1 = g0 + p0c_in
    // c2 = g1 + p1c1
    // c3 = g2 + p2c2
    // c_out = g3 + p3c3

    and and1(p0c_in, p[0], c_in);
    or or1(c1, g[0], p0c_in);

    and and2(p1c1, p[1], c1);
    or or2(c2, g[1], p1c1);

    and and3(p2c2, p[2], c2);
    or or3(c3, g[2], p2c2);

    and and4(p3c3, p[3], c3);
    or or4(c_out, g[3], p3c3);

    // find sums by calling CarryLookaheadAdder1Bit
    CarryLookaheadAdder1Bit carryLookaheadAdder1Bit1(sum[0], a[0], b[0], c_in);
    CarryLookaheadAdder1Bit carryLookaheadAdder1Bit2(sum[1], a[1], b[1], c1);
    CarryLookaheadAdder1Bit carryLookaheadAdder1Bit3(sum[2], a[2], b[2], c2);
    CarryLookaheadAdder1Bit carryLookaheadAdder1Bit4(sum[3], a[3], b[3], c3);


endmodule 