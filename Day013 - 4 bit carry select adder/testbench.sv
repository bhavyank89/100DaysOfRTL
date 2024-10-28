// Code your testbench here
// or browse Examples
module testbench;

  reg [3:0] A, B;
  reg cin;
  wire [3:0] sum;
  wire carry;

  // Instantiate the carry_Select_Adder_4Bit module
  carry_Select_Adder_4Bit uut (
    .A(A),
    .B(B),
    .cin(cin),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    // Display header for the test output
    $display("Time\tA\tB\tcin\tsum\tcarry");
    $display("------------------------------------------------");
	
    $dumpfile("dump.vcd");
    $dumpvars(1,testbench);
    
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, A, B, cin, sum, carry);
    // Test Case 1
    A = 4'b0000; B = 4'b0000; cin = 0;
    #10;

    // Test Case 2
    A = 4'b0101; B = 4'b0011; cin = 0;
    #10;

    // Test Case 3
    A = 4'b0101; B = 4'b0011; cin = 1;
    #10;

    // Test Case 4
    A = 4'b1111; B = 4'b0001; cin = 0;
    #10;

    // Test Case 5
    A = 4'b1111; B = 4'b0001; cin = 1;
    #10;

    // Test Case 6
    A = 4'b1010; B = 4'b1010; cin = 1;
    #10;

    // Test Case 7
    A = 4'b1100; B = 4'b1010; cin = 1;
    #10;

    // End simulation
    $finish;
  end

endmodule
