module testBench_4bit();
  reg [3:0] a, b;
  wire lesser, greater, equal;
  
  // Instantiate the FourBit_Comparator module
  comparator_4Bit BitCom_4 (
    .lesser(lesser),
    .greater(greater),
    .equal(equal),
    .a(a),
    .b(b)
  );
  
  initial begin
    // Initialize inputs
    a = 4'b0000;
    b = 4'b0000;
    
    // Create dumpfile for waveform analysis
    $dumpfile("dump.vcd");
    $dumpvars(1, testBench_4bit);
    
    // Monitor the changes in a, b, lesser, greater, and equal
    $monitor($time, " A=%d, B=%d, L=%b, G=%b, E=%b", a, b, lesser, greater, equal);
    
    // Apply test cases
    #5; a = 4'd12; b = 4'd13;  // Test: A < B
    #5; a = 4'd21; b = 4'd21;  // Test: A == B
    #5; a = 4'd11; b = 4'd5;   // Test: A > B
    
    // End the simulation
    #50; $finish;
  end
  
endmodule
