// Code your testbench here
// or browse Examples
module testBench_fullAdder_1Bit();
  // declaring input
  reg A,B,Cin;
  
  // declaring output
  wire sum,carry;
  
  // instantiation
  fullAdder_1Bit fullAdder(.sum(sum),.carry(carry),.A(A),.B(B),.Cin(Cin));
  
  // stimulation code
  initial begin
    // initialising reg
    A=0;B=0;Cin=0;
    
    // creating dumpfile
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_fullAdder_1Bit);
    
    // monitoring variabloe changes
    $monitor($time,"A=%b,B=%b,Cin=%b,sum=%b,carry=%b",A,B,Cin,sum,carry);
    A=0;B=0;Cin=0;#10;
    A=0;B=0;Cin=1;#10;
    A=0;B=1;Cin=0;#10;
    A=0;B=1;Cin=1;#10;
    A=1;B=0;Cin=0;#10;
    A=1;B=0;Cin=1;#10;
    A=1;B=1;Cin=0;#10;
    A=1;B=1;Cin=1;#10;
    
    $finish;
    
  end
  
endmodule