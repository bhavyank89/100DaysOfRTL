// Code your testbench here
// or browse Examples
module testBench_parityGenerator_3Bit_Odd();
  // input decleration
  reg [2:0]A;
  integer i;
  
  // output decleration
  wire P;
  
  // instantiation
  parityGenerator_3Bit_Odd parityGenrator(P,A);
  
  // stimulation block
  initial begin
    // initialisation of reg
    A = 3'b000;
    
    // creating dumpfile
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_parityGenerator_3Bit_Odd);
    
    // monitoring changing values
    $monitor($time,"A=%b,P=%b",A,P);
    
    // different input 
    for(int i = 0;i<8;i=i+1)
      begin
        A = i;#10;
      end
    
    $finish;
    
  end
  
endmodule