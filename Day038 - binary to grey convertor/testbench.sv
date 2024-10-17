// Code your testbench here
// or browse Examples
module testBench_BtoG();
  reg [3:0] B;
  output [3:0] G;
  integer i ;
  
  binary_to_grey_4Bit BtoG(G,B);
  
  initial begin
    B = 4'b0000;
    
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_BtoG);
    
    $monitor($time," B = %b ,G=%b",B,G);
    for(i=0;i<=16;i++)
      begin
        #5 B = i;
      end
    $finish;
    
  end
  
endmodule