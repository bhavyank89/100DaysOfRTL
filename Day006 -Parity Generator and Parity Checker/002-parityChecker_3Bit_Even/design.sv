// Code your design here
// parityChecker_3Bit_Even
module parityChecker_3Bit_Even(P,A);
  // input decleration
  input [3:0]A;	// A contains data bits and parity bit
  
  // output decleration
  output P;
  
  assign P = ^A;
  
endmodule