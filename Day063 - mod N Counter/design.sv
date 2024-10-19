module modNCounter(count, clk, reset);
  parameter mod = 10;
  parameter length = 4;
  input clk, reset;
  output reg [length-1:0] count;
  
  always @(posedge clk or posedge reset)
  begin
    if (reset == 1)
      count <= 0;
    else
    begin
      if (count == mod)
        count <= 0;
      else
        count <= count + 1;
    end
  end
endmodule