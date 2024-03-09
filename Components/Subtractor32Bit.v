module Subtractor32Bit(output [31:0] result, input [31:0] a, b);
    
    // In this module, I used the 32-bit adder module to subtract two 32-bit numbers.

    wire [31:0] not_b;
    wire c_out; // to ignore the carry out of the adder

    // By 32-bit NOR I've created earlier, I used it to invert the bits of b by NORing it with 32-Bit 0.
    Nor32Bit nor32Bit(not_b, b, 32'b0);

    // By 32-bit adder I've created earlier, get subtration result of a and not_b by giving 1 to carry in.
    CarryLookaheadAdder32Bit carryLookaheadAdder32Bit(result, c_out, a, not_b, 1'b1);

endmodule
