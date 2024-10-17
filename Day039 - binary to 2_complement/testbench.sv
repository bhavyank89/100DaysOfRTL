// Code your testbench here
// or browse Examples
module testBench_2Com();
  reg [3:0] B;
  wire [3:0] complement_2;
  integer i;
  
  binary_to_2Com_4Bit com2(complement_2,B);
  
  initial begin
    B = 4'b0000;
    
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_2Com);
    
    $monitor($time," B = %b, 2's = %b",B,complement_2);
    for(i=0;i<=16;i=i+1)
      begin
        #5 B = i;
      end
    $finish;
    
  end
  
endmodule