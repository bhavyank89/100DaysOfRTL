module testBench_BtoG();
  reg [3:0] B;
  wire [3:0] G;
  integer i;
  
  binary_to_grey_4Bit BtoG(G,B);
  
  initial begin
    B = 4'd0;
    
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_BtoG);
    
    $monitor($time," B = %b, G = %b",B,G);
    for(i=0;i<=16;i=i+1) // Changed i<4'b1111 to i<=4'b1111
      begin
        #5 B = i; // Removed curly braces and placed delay before assignment
      end
    
    $finish;
  end
endmodule
