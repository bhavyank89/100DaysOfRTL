module binary_to_grey_4Bit(G,B);
  input [3:0] B;
  output [3:0] G;
  
  assign G[3] = B[3];          // MSB remains the same
  assign G[2] = B[3] ^ B[2];   // XOR of bit 3 and bit 2
  assign G[1] = B[2] ^ B[1];   // XOR of bit 2 and bit 1
  assign G[0] = B[1] ^ B[0];   // XOR of bit 1 and bit 0 (LSB)
  
endmodule
