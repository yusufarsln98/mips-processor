module shift_left_2_test_bench();

    wire [31:0] shifted_address;
    reg [31:0] address;
    wire current_sign;

    shift_left_2 sl2(
        .shifted_address(shifted_address),
        .address(address)
    );

    initial begin
        // test positive number
        #0 address = 32'b00000000000000110000000000000011;
        #10 $display("time: %0t address = %b, shifted_address = %b", $time, address, shifted_address);

        // test negative number
        #10 address = 32'b11000000000000111000000000001100;
        #10 $display("time: %0t address = %b, shifted_address = %b", $time, address, shifted_address);
        
    end 

endmodule 