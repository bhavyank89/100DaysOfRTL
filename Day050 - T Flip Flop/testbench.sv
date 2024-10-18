module testBench_T_flipFlop();
  reg clk, reset, T;
  wire Q, Qbar;
  
  // Instantiate the T flip-flop
  T_flipFlop T_flipFlop(Q, Qbar, clk, reset, T);
  
  // Generate clock signal
  initial begin
    clk = 1'b0;  
    forever #5 clk = ~clk;  // Clock period is 10 time units
  end
  
  // Test sequence
  initial begin
    reset = 1'b1;  // Start with reset active
    T = 1'b0;
    
    $dumpfile("dump.vcd");   // For waveform generation
    $dumpvars(1, testBench_T_flipFlop);
    
    // Monitor the signals
    $monitor($time, " T = %b, Q = %b, Qbar = %b, reset = %b", T, Q, Qbar, reset);
    
    #10 reset = 1'b0;  // Release reset after 10 time units

    // Test different T input values
    #10 T = 1'b0;  
    #10 T = 1'b1;  
    #10 T = 1'b0;  
    #10 T = 1'b1;  

    #20 $finish;  // End the simulation
  end
  
endmodule
