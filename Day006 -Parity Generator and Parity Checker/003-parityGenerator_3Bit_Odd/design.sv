// Code your design here
// parityGenerator_3Bit_Odd
module parityGenerator_3Bit_Odd(P,A);
  // input decleration
  input [2:0]A;
  
  // output decleration
  output P;
  
  assign P = ~^A;
  
endmodule