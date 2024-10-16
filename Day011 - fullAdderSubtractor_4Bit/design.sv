module fullAdderSubtractor_4Bit(sum,carry,A,B,en);
  input [3:0] A,B;
  input en;  // en = 0 for addition, en = 1 for subtraction
  output [3:0] sum;
  output carry;
  wire [3:0] w;
  wire [3:0] B_xor; // XOR result for subtraction
  
  // XOR the B input with en to handle addition or subtraction
  assign B_xor = B ^ {4{en}};
  
  // Instantiate 1-bit full adders for each bit
  fullAdder FA1(sum[0], w[0], A[0], B_xor[0], en);  // Carry in is 'en' for LSB
  fullAdder FA2(sum[1], w[1], A[1], B_xor[1], w[0]);
  fullAdder FA3(sum[2], w[2], A[2], B_xor[2], w[1]);
  fullAdder FA4(sum[3], carry, A[3], B_xor[3], w[2]);
  
endmodule

module fullAdder(sum,carry,A,B,Cin);
  input A,B,Cin;
  output sum, carry;
  
  assign sum = A ^ B ^ Cin;
  assign carry = (A & B) | ((A ^ B) & Cin);
  
endmodule
