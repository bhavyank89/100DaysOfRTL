module up_Down_Counter(count, up, clk, reset);
  input up, clk, reset;
  output reg [3:0] count;  // 'reg' is required for count since it's assigned in an always block

  always @(posedge clk or posedge reset)
  begin
    if (reset)  // Asynchronous reset handling
      count <= 4'b0000;
    else
    begin
      if (up == 1)  // Count up
      begin
        if (count == 4'b1111)
          count <= 4'b0000;  // Reset when max count is reached
        else
          count <= count + 1;  // Increment
      end
      else  // Count down
      begin
        if (count == 4'b0000)
          count <= 4'b1111;  // Reset to max when min count is reached
        else
          count <= count - 1;  // Decrement
      end
    end
  end
endmodule