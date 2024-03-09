module adder_32bit_plus_4_test_bench();

    reg [31:0] a;
    wire [31:0] sum;

    adder_32bit_plus_4 adder(
        .sum(sum),
        .a(a)
    );
		
    initial begin
        #10 a = 0;
        #10 $display("a = %d, sum = %d", a, sum);

        #10 a = 1;
        #10 $display("a = %d, sum = %d", a, sum);
    end

	
endmodule 