// Code your design here
module gateModeling(output andout,orout,notout,norout,nandout,xorout,xnorout,input A,B);
  
  not not_g(notout,A);
  and and_g(andout,A,B);
  or or_g(orout,A,B);
  nor nor_g(norout,A,B);
  nand nand_g(nandout,A,B);
  xor xor_g(xorout,A,B);
  xnor xnor_g(xnorout,A,B);
  
endmodule