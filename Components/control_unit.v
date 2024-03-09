module control_unit(
    output regDst, 
    output branch, 
    output memRead, 
    output memWrite, 
    output [2:0] ALUop,
    output ALUsrc, 
    output regWrite, 
    output jump,
    output byteOperations, 
    output move,
    input [5:0] opcode
    );
    

    // -----------------------------

    // ALUop values
    // AND         000
    // OR          001
    // XOR         010
    // NOR         011
    // LESS THAN   100
    // ADD         101
    // SUB         110
    // MOD         111

    // -----------------------------

    // R-Types  = 000000    |   ALUop = 111

    // addi     = 000010    |   ALUop = 101
    // subi     = 000011    |   ALUop = 110
    // andi     = 000100    |   ALUop = 000
    // ori      = 000101    |   ALUop = 001
    // slti     = 000111    |   ALUop = 100

    // lw       = 001000    |   ALUop = 101
    // sw       = 010000    |   ALUop = 101
    // lb       = 001001    |   ALUop = 101
    // sb       = 010001    |   ALUop = 101

    // beq      = 100011    |   ALUop = 110
    // bne      = 100111    |   ALUop = 110

    // j        = 111000
    // jal      = 111001
    // jr       = 000000    |   ALUop = 111

    // move     = 100000

    // -----------------------------

    
    // define wires to detect instruction type
    wire r_type, is_addi, is_subi, is_andi, is_ori, is_slti, is_lw, is_sw, is_lb, is_sb, is_beq, is_bne, is_jal;
    wire opcode_not_0, opcode_not_1, opcode_not_2, opcode_not_3, opcode_not_4, opcode_not_5; 
    
    not not0(opcode_not_0,opcode[0]);
    not not1(opcode_not_1,opcode[1]);
    not not2(opcode_not_2,opcode[2]);
    not not3(opcode_not_3,opcode[3]);
    not not4(opcode_not_4,opcode[4]);
    not not5(opcode_not_5,opcode[5]);


    // with and gates, detect instruction type
    and r_type_and(r_type, opcode_not_5, opcode_not_4, opcode_not_3, opcode_not_2, opcode_not_1, opcode_not_0);
    and addi_and(is_addi, opcode_not_5, opcode_not_4, opcode_not_3, opcode_not_2, opcode[1], opcode_not_0);
    and subi_and(is_subi, opcode_not_5, opcode_not_4, opcode_not_3, opcode_not_2, opcode[1], opcode[0]);
    and andi_and(is_andi, opcode_not_5, opcode_not_4, opcode_not_3, opcode[2], opcode_not_1, opcode_not_0);
    and ori_and(is_ori, opcode_not_5, opcode_not_4, opcode_not_3, opcode[2], opcode_not_1, opcode[0]);
    and slti_and(is_slti, opcode_not_5, opcode_not_4, opcode_not_3, opcode[2], opcode[1], opcode[0]);

    and lw_and(is_lw, opcode_not_5, opcode_not_4, opcode[3], opcode_not_2, opcode_not_1, opcode_not_0);
    and sw_and(is_sw, opcode_not_5, opcode[4], opcode_not_3, opcode_not_2, opcode_not_1, opcode_not_0);
    and lb_and(is_lb, opcode_not_5, opcode_not_4, opcode[3], opcode_not_2, opcode_not_1, opcode[0]);
    and sb_and(is_sb, opcode_not_5, opcode[4], opcode_not_3, opcode_not_2, opcode_not_1, opcode[0]);

    and beq_and(is_beq, opcode[5], opcode_not_4, opcode_not_3, opcode_not_2, opcode[1], opcode[0]);
    and bne_and(is_bne, opcode[5], opcode_not_4, opcode_not_3, opcode[2], opcode[1], opcode[0]);

    // assign is_jal = (opcode == 6'b111001);
    and jal_and(is_jal, opcode[5], opcode[4], opcode[3], opcode_not_2, opcode_not_1, opcode[0]);

    // ref: https://www.d.umn.edu/~gshute/mips/control-signal-summary.html
    or or1(regDst, r_type, 0);
    or or2(branch, is_beq, is_bne);
    or or3(memRead, is_lw, is_lb);
    or or4(memWrite, is_sw, is_sb);
    and move_and(move, opcode[5], opcode_not_4, opcode_not_3, opcode_not_2, opcode_not_1, opcode_not_0);
    or or5(regWrite, r_type, is_addi, is_subi, is_andi, is_ori, is_slti, is_lw, is_lb, is_jal, move);
    and jump_and(jump, opcode[5], opcode[4], opcode[3]);
    or byteOperations_or(byteOperations, is_lb, is_sb);
    // not not6(ALUsrc, r_type); 
    or or6(ALUsrc, is_addi, is_subi, is_andi, is_ori, is_slti, is_lw, is_sw, is_lb, is_sb, is_jal, move);
   
    or alu_op1_or(ALUop[2], r_type, is_addi, is_beq, is_bne, is_subi, is_slti, is_lb, is_lw, is_sb, is_sw);
    or alu_op2_or(ALUop[1], is_subi, is_beq, is_bne, r_type);
    or alu_op0_or(ALUop[0], is_addi, is_lb, is_lw, is_sb, is_sw, is_ori, r_type);

endmodule 