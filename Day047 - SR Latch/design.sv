module SR_latch(en, reset, S, R, Q, Qbar);
  input en, reset, S, R;
  output reg Q, Qbar;
  
  always @(en, reset, S, R)
    begin
      if (reset == 1) begin
        Q <= 1'b0;
      end
      else if (en == 1) begin
        case ({S, R})
          2'b00: Q <= Q;    
          2'b01: Q <= 1'b0;   
          2'b10: Q <= 1'b1;   
          2'b11: Q <= 1'bx; 
        endcase
      end
      else begin
        Q <= Q;  
      end
      
      Qbar <= ~Q;  
    end
  
endmodule
