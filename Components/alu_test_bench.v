module alu_test_bench();

    wire[31:0] result;
    wire zero_bit;
    reg[31:0] a;
    reg[31:0] b;
    reg[2:0] aluOp;
    reg c_in;
	 
    alu alu32Bit(result, zero_bit, a, b, aluOp);
	
    initial begin
     

      #0  a = 12112455; b = 232112352; aluOp = 3'b000; c_in = 0;
      #10 $display("time: %0t AND -> %b & %b = %b", $time, a, b, result);

      #10 a = 12112455; b = 232112352; aluOp = 3'b001; c_in = 0;
      #10 $display("time: %0t OR -> %b | %b = %b", $time, a, b, result);

      #10 a = 1212152; b = 2121122; aluOp = 3'b010; c_in = 0;
      #10 $display("time: %0t XOR -> %b ^ %b = %b", $time, a, b, result);

      #10 a = 1212152; b = 2121122; aluOp = 3'b011; c_in = 0;
      #10 $display("time: %0t NOR -> ~(%b | %b) = %b", $time, a, b, result);

      #10 a = 15; b = 12; aluOp = 3'b100; c_in = 0;
      #10 $display("time: %0t LESS THAN -> %d < %d = %d", $time, a, b, result[0]);
		
		  #10 a = 15; b = 15; aluOp = 3'b100; c_in = 0;
      #10 $display("time: %0t LESS THAN -> %d < %d = %d", $time, a, b, result[0]);
      		
		  #10 a = 12; b = 15; aluOp = 3'b100; c_in = 0;
      #10 $display("time: %0t LESS THAN -> %d < %d = %d", $time, a, b, result[0]);

      #10 a = 15; b = 12; aluOp = 3'b101; c_in = 0;
      #10 $display("time: %0t ADD -> %d + %d = %d", $time, a, b, result);

      #10 a = 15; b = 12; aluOp = 3'b110; c_in = 0;
      #10 $display("time: %0t SUB -> %d - %d = %b & zero bit = %d", $time, a, b, result, zero_bit);

      #10 a = 15; b = 15; aluOp = 3'b110; c_in = 0; // test for zero bit
      #10 $display("time: %0t SUB -> %d - %d = %b & zero bit = %d", $time, a, b, result, zero_bit);

      #10 a = 15; b = 22; aluOp = 3'b110; c_in = 0; // test for zero bit
      #10 $display("time: %0t SUB -> %d - %d = %b & zero bit = %d", $time, a, b, result, zero_bit);
    end

endmodule 
