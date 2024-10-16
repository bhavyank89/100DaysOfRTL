// Testbench for 4-bit Full Adder
module testBench_fullAdder_4Bit();

  // Input declarations
  reg [3:0] A;
  reg [3:0] B;
  reg Cin;
  integer i;

  // Output declarations
  wire [3:0] sum;
  wire carry;

  // Instantiation of fullAdder_4Bit
  fullAdder_4Bit fullAdder(.sum(sum), .carry(carry), .A(A), .B(B), .Cin(Cin));

  // Stimulus block
  initial begin
    // Initialize inputs
    A = 4'b0000;
    B = 4'b0000;
    Cin = 0;

    // Create dump file for waveform analysis
    $dumpfile("dump.vcd");
    $dumpvars(1, testBench_fullAdder_4Bit);

    // Monitor variable changes
    $monitor($time, " A=%b, B=%b, Cin=%b, sum=%b, carry=%b", A, B, Cin, sum, carry);

    // Apply different input combinations with a small delay between each step
    for (i = 0; i < 4; i = i + 1) begin
      {Cin, A, B} = i;  // Assign a 9-bit value to the concatenation of Cin, A, and B
      #5;  // Wait for 5 time units
    end
    
    $finish;  // End simulation
  end

endmodule
