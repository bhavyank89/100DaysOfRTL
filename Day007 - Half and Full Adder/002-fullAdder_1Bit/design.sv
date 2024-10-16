// Code your design here
// gate-level-modelling of fullAdder_1Bit
module fullAdder_1Bit(output sum,carry,
  input A,B,Cin);
  
  // internal nets
  wire w1,w2,w3;
  
  // sum logic
  xor xor1(w1,A,B);
  xor xor2(sum,w1,Cin);
  
//   carry logic
  and and1(w2,A,B);
  and and2(w3,w1,Cin);
  
  // final output
  or or1(carry,w2,w3);
  
endmodule