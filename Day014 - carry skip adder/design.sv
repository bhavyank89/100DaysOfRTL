module carry_select_adder_4Bit(
  input [3:0] A, B,
  input cin,
  output [3:0] sum,
  output carryOut
);
  wire [3:0] P;
  wire S;
  wire carry;

  // 4-bit full adder for sum and carry calculation
  fullAdder_4Bit FA1 (.A(A), .B(B), .Cin(cin), .sum(sum), .carry(carry));

  // Generate propagate signals for each bit
  propConstant P0(.A(A[0]), .B(B[0]), .P(P[0]));
  propConstant P1(.A(A[1]), .B(B[1]), .P(P[1]));
  propConstant P2(.A(A[2]), .B(B[2]), .P(P[2]));
  propConstant P3(.A(A[3]), .B(B[3]), .P(P[3]));

  // Overall propagate signal for the 4-bit block
  assign S = P[0] & P[1] & P[2] & P[3];
 
  // MUX to select between cin and carry based on propagate signal
  mux_2_1 mux1 (.I0(carry), .I1(cin), .S(S), .Y(carryOut));
  
endmodule

module fullAdder_4Bit(
  input [3:0] A, B,
  input Cin,
  output [3:0] sum,
  output carry
);
  wire [2:0] w;

  // Ripple carry full adders
  fullAdder_1Bit FA1 (.A(A[0]), .B(B[0]), .Cin(Cin), .sum(sum[0]), .carry(w[0]));
  fullAdder_1Bit FA2 (.A(A[1]), .B(B[1]), .Cin(w[0]), .sum(sum[1]), .carry(w[1]));
  fullAdder_1Bit FA3 (.A(A[2]), .B(B[2]), .Cin(w[1]), .sum(sum[2]), .carry(w[2]));
  fullAdder_1Bit FA4 (.A(A[3]), .B(B[3]), .Cin(w[2]), .sum(sum[3]), .carry(carry));
  
endmodule

module fullAdder_1Bit(
  input A, B, Cin,
  output sum, carry
);
  assign sum = A ^ B ^ Cin;
  assign carry = (A & B) | (Cin & (A ^ B));
endmodule

module mux_2_1(
  input I0, I1, S,
  output Y
);
  assign Y = S ? I1 : I0;
endmodule

module propConstant(
  input A, B,
  output P
);
  // Calculate propagate signal
  assign P = A ^ B;
endmodule