 module memory_block(
    output reg [31:0] read_data, 
    input byteOperations, // (This is an optional signal for lb and sb operations) 
    input [17:0] address, 
    input [31:0] write_data, 
    input memRead, 
    input memWrite);

    reg [31:0] mem [127:0]; // load memory into an array of 128 32-bit words
    reg [1:0] byteSelect; // 00 = least significant byte, 01 = second least significant byte, 10 = third least significant byte, 11 = most significant byte
    reg [17:00] wordAddress; // address of the byte to be read/written

    always @(*) begin
           // least significant 2 bits determine which byte will be selected in the 32-bit word
        byteSelect = address[1:0];
        // get address row by dividing address by 4 (shift right by 2 bits)
        wordAddress = address >> 2;

        $readmemb("memory.mem", mem);
        
        if (byteOperations) begin
            case(byteSelect)
                2'b00: begin
                    if (memWrite) begin
                        mem[wordAddress] = {mem[wordAddress][31:8], write_data[7:0]};
                        $writememb("memory.mem", mem); 
                    end
                    if (memRead) begin
                        read_data = mem[wordAddress][7:0];
                    end
                end
                2'b01: begin
                    if (memWrite) begin
                        mem[wordAddress] = {mem[wordAddress][31:16], write_data[7:0], mem[wordAddress][7:0]};
                        $writememb("memory.mem", mem); 
                    end
                    if (memRead) begin
                        read_data = mem[wordAddress][15:8];
                    end
                end
                2'b10: begin
                    if (memWrite) begin
                        mem[wordAddress] = {mem[wordAddress][31:24], write_data[7:0], mem[wordAddress][15:0]};
                        $writememb("memory.mem", mem); 
                    end
                    if (memRead) begin
                        read_data = mem[wordAddress][23:16];
                    end
                end
                2'b11: begin
                    if (memWrite) begin
                        mem[wordAddress] = {write_data[7:0], mem[wordAddress][23:0]};
                        $writememb("memory.mem", mem); 
                    end
                    if (memRead) begin
                        read_data = mem[wordAddress][31:24];
                    end
                end
            endcase
        end
        else begin
            if (memWrite) begin
                mem[wordAddress] = write_data;
                $writememb("memory.mem", mem); 
            end
            if (memRead) begin
                read_data = mem[wordAddress];
            end
        end
    end
   
endmodule