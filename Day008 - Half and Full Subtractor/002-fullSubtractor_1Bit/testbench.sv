// Code your testbench here
// or browse Examples
module testBench_fullSubtractor_1Bit();
   // decleration of input
  reg A,B,Bin;
  integer i = 0;
  
  // decleration of output
  wire diff;
  wire borrow;
  
  // instantiation
  fullSubtractor_1Bit fullSubtractor(diff,borrow,A,B,Bin);
  
  // stimulation block
  initial begin
    // initialisation
    A=0;B=0;Bin=0;
    
    // creating dumpfile
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_fullSubtractor_1Bit);
    
    // monitoring changing values
    $monitor($time,"A=%b,B=%b,Bin=%b,D=%b,B=%b",A,B,Bin,diff,borrow);
    
    // differnt input values
    for(int i=0;i<8;i=i+1)
      begin
        {A,B}=i;#10;
      end
    $finish;
    
  end
  
endmodule