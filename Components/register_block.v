module register_block(
    output reg [31:0] read_data1,
    output reg [31:0] read_data2,
    input byteOperations, // (This is an optional signal for lb and sb operations)
    input [31:0] write_data,
    input [4:0] read_reg1,
    input [4:0] read_reg2, 
    input [4:0] write_reg,
    input regWrite);

    reg [31:0] registers [31:0];

    always @(*) begin
        $readmemb("registers.mem", registers);
        if(regWrite) begin
            // if not zero register
            if(write_reg != 5'b00000) begin
                registers[write_reg] = write_data;
                $writememb("registers.mem", registers);
            end
        end
        read_data1 = registers[read_reg1];
        read_data2 = registers[read_reg2];
    end

endmodule 