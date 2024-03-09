module sign_extend_test_bench();

    wire [31:0] sign_ext_imm;
    reg [15:0] imm;
    wire current_sign;

    sign_extend se(
        .sign_ext_imm(sign_ext_imm),
        .imm(imm)
    );

    initial begin
        // test positive number
        #0 imm = 16'b0000000000000000;
        #10 $display("time: %0t imm = %b, sign_ext_imm = %b", $time, imm, sign_ext_imm);

        // test negative number
        #10 imm = 16'b1000000000000000;
        #10 $display("time: %0t imm = %b, sign_ext_imm = %b", $time, imm, sign_ext_imm);
        
    end 

endmodule 