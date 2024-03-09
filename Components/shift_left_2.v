module shift_left_2(
    output [31:0] shifted_address,
    input [31:0] address
    );
    // set least significant 30 bits of address as most significant 30 bits of shifted_address
    Or32Bit or32Bit2(shifted_address[31:2], 30'b0, address[29:0]);
    or or1(shifted_address[1], 0, 0);
    or or2(shifted_address[0], 0, 0);

endmodule 