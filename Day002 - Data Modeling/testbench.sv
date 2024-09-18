// Code your testbench here
// or browse Examples
module testBench_dataModeling();
  // input decleration
  reg A,B;
  integer i;
  
  //output decleration
  wire andout,orout,notout,norout,nandout,xorout,xnorout;
  
  // instantiation
  dataModeling DM(andout,orout,notout,norout,nandout,xorout,xnorout,A,B);
  
  // stimulation code
  initial begin
    // initialising reg
    A=0;B=0;
    
    // creating dumpfile
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_dataModeling);
    
    // monitoring variables
    $monitor($time, " A=%b, B=%b, and=%b, or=%b, notA=%b, nor=%b, nand=%b, xor=%b, xnor=%b", 
         A, B, andout, orout, notout, norout, nandout, xorout, xnorout);

    
    // different input values
    for(i=0;i<4;i=i+1)
      begin
        {A,B}=i;#5;
      end
             
    $finish;
    
  end
  
endmodule