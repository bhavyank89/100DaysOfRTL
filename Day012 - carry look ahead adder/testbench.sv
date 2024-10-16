module testBench_cLAA();
// Variable declaration
  reg [3:0] a, b;
  reg cin;
  wire [3:0] sum;
  wire carry;
  
// Instantiation of the carryLookAheadAdder_4Bit module
  carryLookAheadAdder_4Bit CLAA (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
  );
  
// Creating the dump file for waveform analysis
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, testBench_cLAA);
  end

// Test cases
  initial begin
    // Initialization block
    a = 4'b0000;
    b = 4'b0000;
    cin = 1'b0;
    
    // Monitor the values of inputs and outputs during simulation
    $monitor($time, " a=%b, b=%b, sum=%b, carry=%b", a, b, sum, carry);
    
    // Apply test values with some delays
    #5; a = 4'b1001; b = 4'b1100; cin = 1'b0;
    #5; a = 4'b1010; b = 4'b1001; cin = 1'b0;
    #5; a = 4'b0100; b = 4'b0001; cin = 1'b1;

    // End the simulation
    #10 $finish;
  end

endmodule
