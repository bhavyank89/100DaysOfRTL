// Code your design here
module halfSubtractor_1Bit(diff,borrow,A,B);
  // input decleration
  input A,B;
  
  // output decleration
  output diff,borrow;
  
  assign diff = A^B;
  assign borrow = (~A)&B;
  
endmodule