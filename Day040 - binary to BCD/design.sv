module binary_to_BCD_4Bit(BCD, B);
  input [3:0] B;
  output reg [7:0] BCD;
  
  parameter ADD_SIX = 4'b0110; 

  always @(*) begin
    if (B > 9)
      BCD = B + ADD_SIX;  
    else
      BCD = B;          
  end
endmodule
