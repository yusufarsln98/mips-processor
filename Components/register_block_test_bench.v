module register_block_test_bench();

    wire [31:0] read_data1;
    wire [31:0] read_data2;
    reg byteOperations;
    reg [31:0] write_data;
    reg [4:0] read_reg1;
    reg [4:0] read_reg2;
    reg [4:0] write_reg;
    reg regWrite;

    register_block register_block1(
        .read_data1(read_data1), 
        .read_data2(read_data2), 
        .byteOperations(byteOperations), 
        .write_data(write_data), 
        .read_reg1(read_reg1), 
        .read_reg2(read_reg2), 
        .write_reg(write_reg), 
        .regWrite(regWrite)
    );

    initial begin 
        #0  byteOperations = 0; write_data = 32'b01010101010101010101010101010111; read_reg1 = 0; read_reg2 = 13; write_reg = 14; regWrite = 1;
        #10 $display("time: %0t read_data1 = %b |||| read_data2 = %b", $time, read_data1, read_data2);
    end

endmodule 