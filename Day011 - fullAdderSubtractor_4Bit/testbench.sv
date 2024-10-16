module testBench_fullAdderSubtractor;
  // declaring inputs and outputs
  reg [3:0] A,B;
  reg en;
  wire [3:0] sum;
  wire carry;
  
  // instantiation of the fullAdderSubtractor_4Bit module
  fullAdderSubtractor_4Bit FAS4(sum, carry, A, B, en);
  
  integer i; // loop variable

  initial begin
    // Initialize the registers
    A = 4'b0000;
    B = 4'b0000;
    en = 0;
  end
initial begin
    // Create dumpfile for waveform analysis
    $dumpfile("dump.vcd");
    $dumpvars(1, testBench_fullAdderSubtractor);
    
    // Monitor changes in values
    $monitor($time, " A=%b, B=%b, sum=%b, carry=%b, en=%b", A, B, sum, carry, en);

    // Apply test values with a delay
    #5;A = 4'b1010;
  	   B = 4'b1011;
  	   en = 1'b0;
  
  #5;A = 4'b1010;
  	   B = 4'b1011;
  	   en = 1'b1;
end
endmodule
