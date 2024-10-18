module testBench_JKFlipFlop();
  reg clk, reset, J, K;
  wire Q, Qbar;
  
  // Instantiate the JK flip-flop
  JK_FlipFlop JH_flipFlop(Q, Qbar, clk, reset, J, K);
  
  // Generate clock signal
  initial begin
    clk = 1'b0;  
    forever #5 clk = ~clk;  // Clock period is 10 time units
  end
  
  // Test sequence
  initial begin
    reset = 1'b1;  // Start with reset active
    J = 1'b0;
    K = 1'b0;
    
    $dumpfile("dump.vcd");   // For waveform generation
    $dumpvars(1, testBench_JKFlipFlop);
    
    // Monitor the signals
    $monitor($time, " J = %b, K = %b, Q = %b, Qbar = %b", J, K, Q, Qbar);
    
    #10 reset = 1'b0;  // Release reset after 10 time units

    // Test different JK inputs
    #10 J = 1'b0; K = 1'b0;  // Hold state
    #10 J = 1'b0; K = 1'b1;  // Reset state
    #10 J = 1'b1; K = 1'b0;  // Set state
    #10 J = 1'b1; K = 1'b1;  // Toggle state
    
    #20 $finish;  // Give some time after the last test case and finish the simulation
  end
  
endmodule
