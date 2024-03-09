// Instruction     Example         Meaning                         Type OPCODE FUNCTCODE   alu_ctr

// add,            add $1,$2,$3,   $1 = $2 + $3,                     R, 000000, 000010     101
// subtract,       sub $1,$2,$3,   $1 = $2 - $3,                     R, 000000, 000011     110
// and,            and $1,$2,$3,   $1 = $2 & $3,                     R, 000000, 000100     000
// or,             or  $1,$2,$3,   $1 = $2 | $3,                     R, 000000, 000101     001
// set less then,  slt $1,$2,$3,   if ($2 < $3) $1 = 1; else $1 = 0, R, 000000, 000111     100
// jump register,  jr $1,          go to address stored in $1        R, 000000, 001000     xxx


// alu_ctr
// AND         000
// OR          001
// XOR         010
// NOR         011
// LESS THAN   100
// ADD         101
// SUB         110
// MOD         111


// TRUTH TABLE
//  A[2]    A[1]    A[0]        F[5]    F[4]    F[3]    F[2]    F[1]    F[0]        a_c[2]  a_c[1]  a_c[0]
//  0       0       0           x       x       x       x       x       x           0       0       0
//  0       0       1           x       x       x       x       x       x           0       0       1
//  1       0       0           x       x       x       x       x       x           1       0       0
//  1       0       1           x       x       x       x       x       x           1       0       1
//  1       1       0           x       x       x       x       x       x           1       1       0
//  1       1       1           0       0       0       0       1       0           1       0       1
//  1       1       1           0       0       0       0       1       1           1       1       0
//  1       1       1           0       0       0       1       0       0           0       0       0
//  1       1       1           0       0       0       1       0       1           0       0       1
//  1       1       1           0       0       0       1       1       1           1       0       0

// a_c[2] = A[2] & A[1]' | A[2] & A[1] & A[0]' | r_type & F[1]
// a_c[1] = A[2] & A[1] & A[0]' | r_type & [F2]' & F[1] & F[0]
// a_c[0] = A[1]' & A[0] | r_type & F[2]' & F[1] & F[0]' | r_type & F[2] & F[1]' & F[0]

module alu_control(
    output [2:0] alu_ctr,
    input [5:0] function_code,
    input [2:0] ALUop
    );

    wire r_type;
    wire fc_0_not, fc_1_not, fc_2_not;
    wire ALUop_2_not, ALUop_1_not, ALUop_0_not;

    not not_fc_0(fc_0_not, function_code[0]);
    not not_fc_1(fc_1_not, function_code[1]);
    not not_fc_2(fc_2_not, function_code[2]);

    not not_ALUop_2(ALUop_2_not, ALUop[2]);
    not not_ALUop_1(ALUop_1_not, ALUop[1]);
    not not_ALUop_0(ALUop_0_not, ALUop[0]);

    // if ALUop is 111, then it is an R-type instruction
    and r_type_and(r_type, ALUop[2], ALUop[1], ALUop[0]);

    and ac2_and1(w1, ALUop[2], ALUop_1_not);
    and ac2_and2(w2, ALUop[2], ALUop[1], ALUop_0_not);
    and ac2_and3(w3, r_type, function_code[1]);
    or ac2_or(alu_ctr[2], w1, w2, w3);

    and ac1_and1(w4, ALUop[2], ALUop[1], ALUop_0_not);
    and ac1_and2(w5, r_type, fc_2_not, function_code[1], function_code[0]);
    or ac1_or(alu_ctr[1], w4, w5);

    and ac0_and1(w6, ALUop_1_not, ALUop[0]);
    and ac0_and2(w7, r_type, fc_2_not, function_code[1], fc_0_not);
    and ac0_and3(w8, r_type, function_code[2], fc_1_not, function_code[0]);
    or ac0_or(alu_ctr[0], w6, w7, w8);

endmodule 