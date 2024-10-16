// Code your testbench here
// or browse Examples
module testBench_parityChecker_3Bit_Even();
  // input decleration
  reg [3:0]A;
  integer i;
  
  // output decleration
  wire P;
  
  // instantiation
  parityChecker_3Bit_Even parityChecker(P,A);
  
  // stimulation block
  initial begin
    // initialisation of reg
    A = 4'b0000;
    
    // creating dumpfile
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_parityChecker_3Bit_Even);
    
    // monitoring changing values
    $monitor($time,"A=%b,P=%b",A,P);
    
    // different input 
    for(int i = 0;i<15;i=i+1)
      begin
        A = i;#10;
      end
    
    $finish;
    
  end
  
endmodule