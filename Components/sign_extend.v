module sign_extend(
    output [31:0] sign_ext_imm,
    input [15:0] imm
    );

    wire current_sign;
    wire [15:0] extension;

    // or imm most significant bit with 0, set it to as current_sign
    or or1(current_sign, imm[15], 1'b0);

    // set extension to 16 bits of current_sign
    or extension1(extension[15], 0, current_sign);
    or extension2(extension[14], 0, current_sign);
    or extension3(extension[13], 0, current_sign);
    or extension4(extension[12], 0, current_sign);
    or extension5(extension[11], 0, current_sign);
    or extension6(extension[10], 0, current_sign);
    or extension7(extension[9], 0, current_sign);
    or extension8(extension[8], 0, current_sign);
    or extension9(extension[7], 0, current_sign);
    or extension10(extension[6], 0, current_sign);
    or extension11(extension[5], 0, current_sign);
    or extension12(extension[4], 0, current_sign);
    or extension13(extension[3], 0, current_sign);
    or extension14(extension[2], 0, current_sign);
    or extension15(extension[1], 0, current_sign);
    or extension16(extension[0], 0, current_sign);

    // set imm as least significant 16 bits of sign_ext_imm, and extension as most significant 16 bits of sign_ext_imm
    Or16Bit or16Bit1(sign_ext_imm[15:0], 16'b0, imm);
    Or16Bit or16Bit2(sign_ext_imm[31:16], 16'b0, extension);

endmodule 
