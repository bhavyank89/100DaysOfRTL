// Code your testbench here
// or browse Examples
module testBench_halfAdder_nand();
  // input decleration
  reg A,B;
  integer i;
  
  // output decleration
  wire sum,carry;
  
  // instantiation
  halfAdder_Nand HAN(sum,carry,A,B);
  
  // simulation code
  initial begin 
  	// initialsing reg
    A=0;B=0;
    
    // creating dumpfile
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_halfAdder_nand);
    
    // monitoring variable changes
    $monitor($time," A=%b,B=%b,sum=%b,carry=%b",A,B,sum,carry);
    
    // different input variables
    for(i=0;i<4;i=i+1)
      begin
        {A,B}=i;#5;
      end
    $finish;
  end
  
endmodule