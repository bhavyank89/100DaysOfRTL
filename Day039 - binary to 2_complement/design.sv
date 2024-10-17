// Code your design here
module binary_to_2Com_4Bit(complement_2,B);
  input [3:0] B;
  output [3:0] complement_2;
  
  assign complement_2 = (~B)+1;
  
  
endmodule