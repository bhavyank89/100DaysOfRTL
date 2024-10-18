module T_flipFlop(Q, Qbar, clk, reset, T);

  input clk, reset, T;
  output reg Q, Qbar;
  
  always @(posedge clk) begin
    if (reset)
      Q <= 1'b0; 
    else
      Q <= ~T;
      
    Qbar <= ~Q;  
  end

endmodule
