// Code your design here
module dataModeling(output andout,orout,notout,norout,nandout,xorout,xnorout,input A,B);
  
  assign andout = A&B;
  assign orout = A|B;
  assign notout = ~A;
  assign nandout = ~(A&B);
  assign norout = ~(A|B);
  assign xorout = A^B;
  assign xnorout = ~(A^B);
  
endmodule