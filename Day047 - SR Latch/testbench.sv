module testBench_SRLatch();
  reg en, reset, S, R;
  wire Q, Qbar;
  
  SR_latch SRlatch(en, reset, S, R, Q, Qbar);  // Instantiate the SR latch
  
  initial begin
    en = 1'b0;
    reset = 1'b0;
    S = 1'b0;
    R = 1'b0;
    
    $dumpfile("dump.vcd"); 
    $dumpvars(1, testBench_SRLatch);
    
    $monitor($time, " en = %b, reset = %b, S = %b, R = %b, Q = %b, Qbar = %b", en, reset, S, R, Q, Qbar);
    
    #5 en = 1; S = 0; R = 0;        // Hold state
    #5 en = 1; S = 0; R = 1;        // Reset
    #5 en = 1; S = 1; R = 0;        // Set
    #5 en = 1; S = 1; R = 1;        // Invalid state
    #5 reset = 1'b1;                // Assert reset
    #5 reset = 1'b0; S = 0; R = 0;  // Deactivate reset, hold state again

    #10 $finish;                    // End simulation
  end
  
endmodule
