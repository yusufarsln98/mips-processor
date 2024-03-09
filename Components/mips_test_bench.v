module mips_test_bench();
  reg clock;
  // Instantiate MIPS module
  mips uut(.clock(clock));

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  // Test scenario
  initial begin
    #400;
    $finish;
  end

endmodule




