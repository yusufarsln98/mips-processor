module alu_control_test_bench();
    wire [2:0] alu_ctr;
    reg [5:0] function_code;
    reg [2:0] ALUop;

    alu_control alu_control1(alu_ctr, function_code, ALUop);

    initial begin

        #0  function_code = 6'b000000; ALUop = 3'b000;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);

        #100 function_code = 6'b000000; ALUop = 3'b001;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);

        #100 function_code = 6'b000000; ALUop = 3'b100;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);

        #100 function_code = 6'b000000; ALUop = 3'b101;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);

        #100 function_code = 6'b000000; ALUop = 3'b110;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);

        #100 function_code = 6'b000010; ALUop = 3'b111;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);
        
        #100 function_code = 6'b000011; ALUop = 3'b111;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);

        #100 function_code = 6'b000100; ALUop = 3'b111;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);

        #100 function_code = 6'b000101; ALUop = 3'b111;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);

        #100 function_code = 6'b000111; ALUop = 3'b111;
        #100 $display("time: %0t %b - %b = %b", $time, function_code, ALUop, alu_ctr);

    end 

endmodule 