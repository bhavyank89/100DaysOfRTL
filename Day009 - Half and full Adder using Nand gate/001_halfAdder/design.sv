// Code your design here
module halfAdder_Nand(output sum,carry,input A,B);
  wire w1,w2,w3;
  
  // logic for sum
  nand nand_g1(w1,A,B);
  nand nand_g2(w2,w1,A);
  nand nand_g3(w3,w1,B);
  nand nand_g4(sum,w2,w3);
  
  // logic for carry
  nand nand_g5(carry,w1,w1);
  
endmodule