module control_unit_test_bench();
    wire[2:0] ALUop;
    wire regDst,
            branch,
            memRead,
            memWrite,
            ALUsrc,
            regWrite,
            jump,
            byteOperations,
            move;

    reg[5:0] opcode;

    control_unit control_unit(
        regDst,
        branch,
        memRead,
        memWrite,
        ALUop,
        ALUsrc,
        regWrite,
        jump,
        byteOperations,
        move,
        opcode
    );


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
    // jr       = 000000

    // move     = 100000
    
    initial begin
        #0 opcode = 6'b000000;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b000010;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b000011;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b000100;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b000101;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b000111;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b001000;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b010000;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b001001;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b010001;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b100011;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b, ", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b100111;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b, ", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b111000;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b, ", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b111001;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b, ", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);

        #10 opcode = 6'b100000;
        #10 $display("time: %0t opcode = %b, regDst = %b, branch = %b, memRead = %b, memWrite = %b, ALUop = %b, ALUsrc = %b, regWrite = %b, jump = %b, byteOperations = %b, move = %b, ", $time, opcode, regDst, branch, memRead, memWrite, ALUop, ALUsrc, regWrite, jump, byteOperations, move);


    end 
endmodule 