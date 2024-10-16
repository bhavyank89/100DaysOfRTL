// Code your testbench here
// or browse Examples
module testBench_4_1();
  reg S0, S1, I0, I1, I2, I3;
  wire Y;
  
  // Instantiate the 4:1 multiplexer
  mux_4_1_using_2_1 mux4_1(Y, S0, S1, I0, I1, I2, I3);
  
  initial begin
    // Initialize input signals
    S0 = 0; S1 = 0; I0 = 1; I1 = 0; I2 = 1; I3 = 1;
    
    // Setup the dump file and variables for waveform analysis
    $dumpfile("dump.vcd");
    $dumpvars(1, testBench_4_1);
    
    // Display the initial input values
    $display("I0 = %b, I1 = %b, I2 = %b, I3 = %b", I0, I1, I2, I3);
    
    // Monitor the inputs and outputs
    $monitor($time, " S0 = %b, S1 = %b, Y = %b", S0, S1, Y);
    
    // Test cases for different select inputs
    #5; S0 = 0; S1 = 1;  // Expect Y = I1
    #5; S0 = 0; S1 = 0;  // Expect Y = I0
    #5; S0 = 1; S1 = 0;  // Expect Y = I2
    #5; S0 = 1; S1 = 1;  // Expect Y = I3
    
    $finish;
  end
  
endmodule
