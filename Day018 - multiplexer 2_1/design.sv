// Code your design here
module mux_2_1(Y,I0,I1,S0);
  input S0,I0,I1;
  output reg Y;
  
  always@(*)
    begin
      case(S0)
        1'b0 : assign Y = I0;
        1'b1 : assign Y = I1;
        default : assign Y = 1'bx;
      endcase
    end
    
  
endmodule