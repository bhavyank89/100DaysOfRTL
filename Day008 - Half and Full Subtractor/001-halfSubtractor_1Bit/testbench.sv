// Code your testbench here
// or browse Examples
module testBench_halfSubtractor_1Bit();
   // decleration of input
  reg A,B;
  integer i = 0;
  
  // decleration of output
  wire diff;
  wire borrow;
  
  // instantiation
  halfSubtractor_1Bit halfSubtractor(diff,borrow,A,B);
  
  // stimulation block
  initial begin
    // initialisation
    A=0;B=0;
    
    // creating dumpfile
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_halfSubtractor_1Bit);
    
    // monitoring changing values
    $monitor($time,"A=%b,B=%b,D=%b,B=%b",A,B,diff,borrow);
    
    // differnt input values
    for(int i=0;i<4;i=i+1)
      begin
        {A,B}=i;#10;
      end
    $finish;
    
  end
  
endmodule