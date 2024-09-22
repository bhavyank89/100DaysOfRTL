// Code your design here
module behaviouralModeling (output reg andout,orout,notout,norout,nandout,xorout,xnorout,input A,B);
  
  always@(*)
    begin
      andout = A&B;
  	  orout = A|B;
      notout = ~A;
      nandout = ~(A&B);
      norout = ~(A|B);
      xorout = A^B;
      xnorout = ~(A^B);
    end
  
endmodule