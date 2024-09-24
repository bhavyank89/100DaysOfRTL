// Code your design here
module multiplexer_4_1_data(Y,S1,S0,I0,I1,I2,I3);
  // decleration of input
  input S1,S0,I0,I1,I2,I3;
  
  // decleration of output
  output Y;
  
  // assignment
  assign Y = (~S1 & ~S0 & I0) | (~S1 & S0 & I1) | (S1 & ~S0 & I2) | (S1 & S0 & I3);

endmodule