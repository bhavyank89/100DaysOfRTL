// 4-bit Full Adder
module fullAdder_4Bit(output [3:0] sum, output carry, input [3:0] A, input [3:0] B, input Cin);
  wire c1, c2, c3;  // Internal carry wires
  
  // Instantiation of 1-bit full adders
  fullAdder_1Bit FA1(.sum(sum[0]), .carry(c1), .A(A[0]), .B(B[0]), .Cin(Cin));
  fullAdder_1Bit FA2(.sum(sum[1]), .carry(c2), .A(A[1]), .B(B[1]), .Cin(c1));
  fullAdder_1Bit FA3(.sum(sum[2]), .carry(c3), .A(A[2]), .B(B[2]), .Cin(c2));
  fullAdder_1Bit FA4(.sum(sum[3]), .carry(carry), .A(A[3]), .B(B[3]), .Cin(c3));
  
endmodule

// 1-bit Full Adder
module fullAdder_1Bit(output sum, output carry, input A, input B, input Cin);
  wire w1, w2, w3;
  
  // Sum logic
  xor xor1(w1, A, B);
  xor xor2(sum, w1, Cin);
  
  // Carry logic
  and and1(w2, A, B);
  and and2(w3, w1, Cin);
  or or1(carry, w2, w3);
  
endmodule