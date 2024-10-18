module JK_FlipFlop(Q, Qbar, clk, reset, J, K);
  
  input clk, reset, J, K;
  output reg Q, Qbar;
  
  always @(posedge clk) begin
    if (reset)
      Q <= 1'b0;
    else begin
      case ({J, K})
        2'b00: Q <= Q;      // Hold state
        2'b01: Q <= 1'b0;   // Reset
        2'b10: Q <= 1'b1;   // Set
        2'b11: Q <= ~Q;     // Toggle
      endcase
    end
    Qbar <= ~Q;  // Update Qbar after Q is updated
  end
  
endmodule
