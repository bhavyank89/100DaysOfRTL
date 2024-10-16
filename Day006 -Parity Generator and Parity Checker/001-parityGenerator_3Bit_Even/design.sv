// Code your design here
// parityGenerator_3Bit_Even
module parityGenerator_3Bit_Even(P,A);
  // input decleration
  input [2:0]A;
  
  // output decleration
  output P;
  
  assign P = ^A;
  
endmodule