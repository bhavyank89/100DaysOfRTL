// Code your testbench here
// or browse Examples
module testBench_BCDtoExcess3();
  reg [3:0] BCD;
  wire [3:0] excess3;
  integer i;
  
  BCD_to_excess3_4Bit BCD2Excess3(excess3,BCD);
  
  initial begin
    BCD = 4'B0000;
    
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_BCDtoExcess3);
    
    $monitor($time," BCD = %b,Excess3 = %b",BCD,excess3);
    for(i=0;i<=16;i=i+1)begin
      #5 BCD = i;
    end
    $finish;
  end
  
endmodule