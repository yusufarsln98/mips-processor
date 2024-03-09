module instruction_block_test_bench();
    wire [31:0] instruction;
    reg [31:0] pc;

    instruction_block instruction_block(
        .instruction(instruction),
        .pc(pc)
    );

    initial begin
        #0 pc = 0;
        #10 $display("time: %0t pc: %d instruction: %b", $time, pc, instruction);

        #10 pc = 4092;
        #10 $display("time: %0t pc: %d instruction: %b", $time, pc, instruction);

    end

endmodule 