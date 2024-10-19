module testBench_upDownCounter();
  reg up, clk, reset;
  wire [3:0] count;
  
  // Instantiate the up_Down_Counter module
  up_Down_Counter dut (
    .count(count),
    .up(up),
    .clk(clk),
    .reset(reset)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clock every 5 time units
  end

  // Stimulus
  initial begin
    // Apply reset
    reset = 1;
    up = 1;  // Initially count up
    #10 reset = 0;  // Deassert reset after 10 time units

    // Monitor count
    $monitor($time, " up = %b, count = %d", up, count);

    // After 50 time units, change direction to count down
    #50 up = 0;
   
    // End simulation after 500 time units
    #500 $finish;
  end

  // Optional: Dumping waveform data for analysis
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, testBench_upDownCounter);
  end

endmodule