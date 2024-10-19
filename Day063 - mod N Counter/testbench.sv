module testBench_modNCounter();
  reg clk, reset;
  wire [3:0] count;  // Adjust the wire width to match the counter output

  // Instantiate the modNCounter module
  modNCounter #(10, 4) modNCount(count, clk, reset);  // Match parameters

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clock every 5 time units
  end

  // Stimulus
  initial begin
    reset = 1;  // Assert reset
    #10 reset = 0;  // Deassert reset after 10 time units
  end

  // Dumping waveform data
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, testBench_modNCounter);
  end

  // Monitor count values
  initial begin
    $monitor($time, " count = %b", count);
  end

  // End simulation after a specified time
  initial begin
    #500 $finish;
  end

endmodule