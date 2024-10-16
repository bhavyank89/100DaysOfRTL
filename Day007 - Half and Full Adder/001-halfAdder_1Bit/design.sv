// Code your design here
module halfAdder_1Bit(output sum,carry,input A,B);
  assign sum = A^B;
  assign carry = A&B;
endmodule