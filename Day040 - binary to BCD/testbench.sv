// Code your testbench here
// or browse Examples
module testBench_BtoBCD();
  reg [3:0] B;
  wire [7:0] BCD;
  integer i;
  
  binary_to_BCD_4Bit BtoBCD(BCD,B);
  
  initial begin
    B = 4'b0000;
    
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_BtoBCD);
    
    $monitor($time," B = %b,BCD = %b",B,BCD);
    
    for(i=0;i<=16;i=i+1)begin
      #5 B = i;
    end
    
  $finish;
  end
  
endmodule