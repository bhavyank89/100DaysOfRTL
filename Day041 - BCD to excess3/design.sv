// Code your design here
module BCD_to_excess3_4Bit(excess3,BCD);
  input [3:0] BCD;
  output reg [3:0] excess3;
  
  always@(*)
    begin
      if(BCD<=9)
        excess3 = BCD + 4'b0011;
      else
        excess3 = 4'bxxxx;
    end
endmodule