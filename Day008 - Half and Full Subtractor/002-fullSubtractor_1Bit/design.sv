// Code your design here
module fullSubtractor_1Bit(diff,borrow,A,B,Bin);
  // input decleration
  input A,B,Bin;
  
  // output decleration
  output diff,borrow;
  
  assign diff = A^B^Bin;
  assign borrow = (~A)&(B|Bin)|(B&Bin);
  
endmodule