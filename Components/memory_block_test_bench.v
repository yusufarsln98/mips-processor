module memory_block_test_bench();

   wire [31:0] read_data;
   reg byteOperations;
   reg [17:0] address;
   reg [31:0] write_data;
   reg memRead;
   reg memWrite;

   memory_block memory_block1(
       .read_data(read_data), 
       .byteOperations(byteOperations), 
       .address(address), 
       .write_data(write_data), 
       .memRead(memRead), 
       .memWrite(memWrite)
   );
	// Adres BOZUK GIDIYOR! ANLAMADIM AQ
	 
   initial begin
        #10 byteOperations = 1; address = 18'b000000000000001000; write_data = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; memRead = 1; memWrite = 0;
        #10 $display("time: %0t read_data = %b", $time, read_data);

        #10 byteOperations = 0; address = 18'b000000000000001111; write_data = 32'b00000000000000000000000000000001; memRead = 0; memWrite = 1;
        #10 $display("time: %0t read_data = %b", $time, read_data);

        #10 byteOperations = 1; address = 18'b000000000000001111; write_data = 32'b00000000000000000000000000000001; memRead = 0; memWrite = 1;
        #10 $display("time: %0t read_data = %b", $time, read_data);
         

   end


endmodule 