module carry_Select_Adder_4Bit(
  input [3:0] A, B,
  input cin,
  output [3:0] sum,
  output carry
);
  wire [3:0] sum1, sum2;
  wire carry1, carry2;

  // Two instances of 4-bit adders with cin = 0 and cin = 1
  fullAdder_4Bit FA1 (.A(A), .B(B), .Cin(0), .sum(sum1), .carry(carry1));
  fullAdder_4Bit FA2 (.A(A), .B(B), .Cin(1), .sum(sum2), .carry(carry2));

  // MUXes to select the correct sum and carry based on cin
  mux_2_1 mux1 (.I0(carry1), .I1(carry2), .S(cin), .Y(carry));
  mux_2_1 mux2 (.I0(sum1[0]), .I1(sum2[0]), .S(cin), .Y(sum[0]));
  mux_2_1 mux3 (.I0(sum1[1]), .I1(sum2[1]), .S(cin), .Y(sum[1]));
  mux_2_1 mux4 (.I0(sum1[2]), .I1(sum2[2]), .S(cin), .Y(sum[2]));
  mux_2_1 mux5 (.I0(sum1[3]), .I1(sum2[3]), .S(cin), .Y(sum[3]));
  
endmodule

module fullAdder_4Bit(
  input [3:0] A, B,
  input Cin,
  output [3:0] sum,
  output carry
);
  wire [2:0] w;

  // 4 1-bit full adders chained together
  fullAdder_1Bit FA1 (.A(A[0]), .B(B[0]), .Cin(Cin), .sum(sum[0]), .carry(w[0]));
  fullAdder_1Bit FA2 (.A(A[1]), .B(B[1]), .Cin(w[0]), .sum(sum[1]), .carry(w[1]));
  fullAdder_1Bit FA3 (.A(A[2]), .B(B[2]), .Cin(w[1]), .sum(sum[2]), .carry(w[2]));
  fullAdder_1Bit FA4 (.A(A[3]), .B(B[3]), .Cin(w[2]), .sum(sum[3]), .carry(carry));
  
endmodule

module fullAdder_1Bit(
  input A, B, Cin,
  output sum, carry
);
  // Define sum and carry using assign statements
  assign sum = A ^ B ^ Cin;
  assign carry = (A & B) | (Cin & (A ^ B));
endmodule

module mux_2_1(
  input I0, I1, S,
  output Y
);
  // Define the MUX functionality using an assign statement
  assign Y = S ? I1 : I0;
endmodule
