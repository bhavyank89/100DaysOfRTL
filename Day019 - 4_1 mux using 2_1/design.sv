// Code your design here
// 4:1 Mux using two 2:1 Muxes
module mux_4_1_using_2_1(Y, S0, S1, I0, I1, I2, I3);
  input S0, S1, I0, I1, I2, I3;  // Inputs
  output Y;  // Output
  wire Y1, Y0;  // Intermediate signals for mux outputs
  
  // Instantiate two 2:1 multiplexers for the lower and upper halves
  mux_2_1 mux1(Y0, S1, I0, I1);  // Y0 is the output of mux1 for I0 and I1
  mux_2_1 mux2(Y1, S1, I2, I3);  // Y1 is the output of mux2 for I2 and I3
  
  // Instantiate the final 2:1 multiplexer to select between Y0 and Y1
  mux_2_1 mux3(Y, S0, Y0, Y1);   // Y is the final output
  
endmodule

// 2:1 Mux module definition
module mux_2_1(Y, S, I0, I1);
  input S, I0, I1;  // Inputs
  output Y;  // Output
  
  // 2:1 Mux logic
  assign Y = S ? I1 : I0;  // If S is 1, select I1; otherwise, select I0
  
endmodule
