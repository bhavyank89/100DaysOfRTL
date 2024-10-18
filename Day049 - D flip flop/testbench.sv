module testBench_D_flipFlop();
  reg clk, reset, D;
  wire Q, Qbar;
  
  // Instantiate the D flip-flop
  D_flipFlop D_flipFlop(Q, Qbar, clk, reset, D);
  
  // Generate clock signal
  initial begin
    clk = 1'b0;  
    forever #5 clk = ~clk;  // Clock period is 10 time units
  end
  
  // Test sequence
  initial begin
    reset = 1'b1;  // Start with reset active
    D = 1'b0;
    
    $dumpfile("dump.vcd");   // For waveform generation
    $dumpvars(1, testBench_D_flipFlop);
    
    // Monitor the signals
    $monitor($time, " D = %b, Q = %b, Qbar = %b, reset = %b", D, Q, Qbar, reset);
    
    #10 reset = 1'b0;  // Release reset after 10 time units

    // Test different D input values
    #10 D = 1'b0;  // Q should stay 0
    #10 D = 1'b1;  // Q should become 1
    #10 D = 1'b0;  // Q should become 0
    #10 D = 1'b1;  // Q should become 1

    #20 $finish;  // End the simulation
  end
  
endmodule
