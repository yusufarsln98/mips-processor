
module adder_32bit_plus_shifted_test_bench();
    wire [31:0] sum;
    reg [31:0] a;
    reg [31:0] shifted;

    adder_32bit_plus_shifted adder(
        .sum(sum),
        .a(a),
        .shifted(shifted)
    );
		
    initial begin
        #10 a = 0; shifted = 3;
        #10 $display("a = %d shifted = %d, sum = %d", a, shifted, sum);

        #10 a = 1; shifted = 3;
        #10 $display("a = %d shifted = %d, sum = %d", a, shifted, sum);
    end

endmodule 