module D_flipFlop(Q, Qbar, clk, reset, D);

  input clk, reset, D;
  output reg Q, Qbar;
  
  always @(posedge clk) begin
    if (reset)
      Q <= 1'b0; 
    else
      Q <= D;     
      
    Qbar <= ~Q;  
  end

endmodule
