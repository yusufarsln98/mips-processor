/*
    // beq false scenario
    1- addi
    000010 00000 00001 0000000000000100

    2- sw
    010000 00000 00001 0000000000000000

    3- lw
    001000 00000 00010 0000000000000000

    4- or
    000000 00010 00001 00011 00000 000101

    5- subi
    000011 00011 00100 0000000000000001

    6- beq
    100011 00011 00100 0000000000000001

    7- or
    000000 00011 00100 00101 00000 000101

    8- sub
    000000 00011 00100 00110 00000 000011

    9- jal
    111001 00000000000000000000001001

    10- slt
    000000 00110 00101 00111 00000 000111

    11- move
    100000 00101 01000 0000000000000000

    12- sb
    010001 00000 00001 0000000000000001

    00001000
    00000001
    00000000
    00000100
    01000000
    00000001
    00000000
    00000000
    00100000
    00000010
    00000000
    00000000
    00000000
    01000001
    00011000
    00000101
    00001100
    01100100
    00000000
    00000001
    10001100
    01100100
    00000000
    00000001
    00000000
    01100100
    00101000
    00000101
    00000000
    01100100
    00110000
    00000011
    11100100
    00000000
    00000000
    00001001
    00000000
    11000101
    00111000
    00000111
    10000000
    10101000
    00000000
    00000000

    ....
*/

module mips(input clock);

    reg [31:0] pc;

    initial begin
        pc = 32'b0;
    end

    // instruction block
    wire [31:0] instruction;
    wire [5:0] opcode;
    wire [4:0] read_reg1;
    wire [4:0] read_reg2;
    wire [4:0] write_reg;
    wire [4:0] shamt; // will be ignored
    wire [5:0] function_code;
    wire [15:0] imm;
    wire [31:0] sign_ext_imm;
    wire [31:0] sign_ext_imm_shifted_left_2;

    instruction_block instruction_block(
        .instruction(instruction),
        .pc(pc)
    );

    // parsing instruction
    // opcode
    or or_opcode1(opcode[5], 1'b0, instruction[31]);
    or or_opcode2(opcode[4], 1'b0, instruction[30]);
    or or_opcode3(opcode[3], 1'b0, instruction[29]);
    or or_opcode4(opcode[2], 1'b0, instruction[28]);
    or or_opcode5(opcode[1], 1'b0, instruction[27]);
    or or_opcode6(opcode[0], 1'b0, instruction[26]);

    // read_reg1
    or or_read_reg1_1(read_reg1[4], 1'b0, instruction[25]);
    or or_read_reg1_2(read_reg1[3], 1'b0, instruction[24]);
    or or_read_reg1_3(read_reg1[2], 1'b0, instruction[23]);
    or or_read_reg1_4(read_reg1[1], 1'b0, instruction[22]);
    or or_read_reg1_5(read_reg1[0], 1'b0, instruction[21]);

    // read_reg2
    or or_read_reg2_1(read_reg2[4], 1'b0, instruction[20]);
    or or_read_reg2_2(read_reg2[3], 1'b0, instruction[19]);
    or or_read_reg2_3(read_reg2[2], 1'b0, instruction[18]);
    or or_read_reg2_4(read_reg2[1], 1'b0, instruction[17]);
    or or_read_reg2_5(read_reg2[0], 1'b0, instruction[16]);

    // write_reg
    or or_write_reg_1(write_reg[4], 1'b0, instruction[15]);
    or or_write_reg_2(write_reg[3], 1'b0, instruction[14]);
    or or_write_reg_3(write_reg[2], 1'b0, instruction[13]);
    or or_write_reg_4(write_reg[1], 1'b0, instruction[12]);
    or or_write_reg_5(write_reg[0], 1'b0, instruction[11]);

    // shamt
    or or_shamt_1(shamt[4], 1'b0, instruction[10]);
    or or_shamt_2(shamt[3], 1'b0, instruction[9]);
    or or_shamt_3(shamt[2], 1'b0, instruction[8]);
    or or_shamt_4(shamt[1], 1'b0, instruction[7]);
    or or_shamt_5(shamt[0], 1'b0, instruction[6]);

    // function_code
    or or_function_code_1(function_code[5], 1'b0, instruction[5]);
    or or_function_code_2(function_code[4], 1'b0, instruction[4]);
    or or_function_code_3(function_code[3], 1'b0, instruction[3]);
    or or_function_code_4(function_code[2], 1'b0, instruction[2]);
    or or_function_code_5(function_code[1], 1'b0, instruction[1]);
    or or_function_code_6(function_code[0], 1'b0, instruction[0]);

   
    or or_imm_1(imm[15], 1'b0, instruction[15]);
    or or_imm_2(imm[14], 1'b0, instruction[14]);
    or or_imm_3(imm[13], 1'b0, instruction[13]);
    or or_imm_4(imm[12], 1'b0, instruction[12]);
    or or_imm_5(imm[11], 1'b0, instruction[11]);
    or or_imm_6(imm[10], 1'b0, instruction[10]);
    or or_imm_7(imm[9], 1'b0, instruction[9]);
    or or_imm_8(imm[8], 1'b0, instruction[8]);
    or or_imm_9(imm[7], 1'b0, instruction[7]);
    or or_imm_10(imm[6], 1'b0, instruction[6]);
    or or_imm_11(imm[5], 1'b0, instruction[5]);
    or or_imm_12(imm[4], 1'b0, instruction[4]);
    or or_imm_13(imm[3], 1'b0, instruction[3]);
    or or_imm_14(imm[2], 1'b0, instruction[2]);
    or or_imm_15(imm[1], 1'b0, instruction[1]);
    or or_imm_16(imm[0], 1'b0, instruction[0]);

    // sign_ext_imm
    sign_extend sgn_extend(
        .sign_ext_imm(sign_ext_imm),
        .imm(imm)
    );

    // sign_ext_imm_shifted_left_2
    shift_left_2 sft_left_2(
        .shifted_address(sign_ext_imm_shifted_left_2),
        .address(sign_ext_imm)
    );


    // control unit
    wire regDst;
    wire branch;
    wire memRead;
    wire memWrite;
    wire [2:0] ALUop;
    wire ALUsrc;
    wire regWrite;
    wire jump;
    wire byteOperations;
    wire move;

    control_unit ctrl_unit(
        .regDst(regDst),
        .branch(branch),
        .memRead(memRead),
        .memWrite(memWrite),
        .ALUop(ALUop),
        .ALUsrc(ALUsrc),
        .regWrite(regWrite),
        .jump(jump),
        .byteOperations(byteOperations),
        .move(move),
        .opcode(opcode)
    );


    // from regDst, find write_reg
    wire [4:0] write_reg_final;
    // assign write_reg_final = regDst ? write_reg : read_reg2;

    // register block
    wire [31:0] read_data1;
    wire [31:0] read_data2;
    wire [31:0] write_reg_data; // this will be result of Data Memory

    register_block rgstr_block(
        .read_data1(read_data1),
        .read_data2(read_data2),
        .byteOperations(byteOperations),
        .write_data(write_reg_data),
        .read_reg1(read_reg1),
        .read_reg2(read_reg2),
        .write_reg(write_reg_final),
        .regWrite(regWrite)
    );

    // alu control
    wire [2:0] alu_ctr;
    alu_control alu_ctrl(
        .alu_ctr(alu_ctr),
        .function_code(function_code),
        .ALUop(ALUop)
    );

    // alu
    wire [31:0] alu_src1;
    wire [31:0] alu_src2;
    wire [31:0] alu_result;
    wire zero_bit;

    assign alu_src1 = read_data1;
    assign alu_src2 = ALUsrc ? sign_ext_imm : read_data2;

    alu alu1(
        .alu_result(alu_result),
        .zero_bit(zero_bit),
        .alu_src1(alu_src1),
        .alu_src2(alu_src2),
        .alu_ctr(alu_ctr)
    );

    // data memory
    wire [31:0] read_data;
    wire [17:0] address;
    wire [31:0] write_mem_data;

    assign address = alu_result[17:0];
    assign write_mem_data = read_data2;

    memory_block mem_block(
        .read_data(read_data),
        .byteOperations(byteOperations),
        .address(address),
        .write_data(write_mem_data),
        .memRead(memRead),
        .memWrite(memWrite)
    );


    // find whether branch or jump or not
    wire is_beq, is_bne; // beq opcode = 100011, bne opcode = 100111
    wire is_j, is_jal, is_jr; // j opcode = 111000, jal opcode = 111001, jr function_code = 001000

    // we already have 'branch' in control unit
    // however it does not specify whether it is beq or bne
    assign is_beq = (opcode == 6'b100011);
    assign is_bne = (opcode == 6'b100111);

    // we already have 'jump' in control unit
    // however it does not specify whether it is j, jal or jr
    assign is_j = (opcode == 6'b111000);
    assign is_jal = (opcode == 6'b111001);
    assign is_jr = (function_code == 6'b001000);

    // alu returns zero_bit if both inputs are equal
    wire [31:0] pc_plus_4;
    // assign pc_plus_4 = pc + 4;
    adder_32bit_plus_4 adder_32bit_plus_4_1(
        .sum(pc_plus_4),
        .a(pc)
    );

    wire [31:0] pc_plus_4_plus_shifted_address;
    // assign pc_plus_4_plus_shifted_address = pc_plus_4 + sign_ext_imm_shifted_left_2;
    adder_32bit_plus_shifted adder_32bit_plus_shifted_1(
        .sum(pc_plus_4_plus_shifted_address),
        .a(pc_plus_4),
        .shifted(sign_ext_imm_shifted_left_2)
    );

    wire [31:0] next_pc;
    assign branch_cond = (branch & is_beq & zero_bit) | (branch & is_bne & ~zero_bit);
    assign next_pc = branch_cond ? pc_plus_4_plus_shifted_address : (is_j | is_jal) ? sign_ext_imm_shifted_left_2 : (is_jr) ? read_data1 : pc_plus_4;
    assign write_reg_final = regDst ? write_reg : is_jal ? 5'b11111 : read_reg2;
    assign write_reg_data = move ? read_data1 : (memRead ? read_data : is_jal ? pc_plus_4 : alu_result);

    always @(posedge clock) begin
        #5 $display("pc: %d", pc);
        #5 $display("branch_cond: %b", branch_cond);
        #5 $display("zero_bit: %b", zero_bit);
        #5 $display("instruction: %b", instruction);
        #5 $display("move: %b", move);
        pc <= next_pc;
    end

endmodule 