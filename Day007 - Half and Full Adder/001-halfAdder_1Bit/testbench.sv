module testBench_halfAdder_1Bit();
  // input and output declaration
  reg A, B;
  wire carry, sum;
  integer i;  // i should be an integer

  // instantiation
  halfAdder_1Bit HA(.sum(sum), .carry(carry), .A(A), .B(B));

  // test cases
  initial begin
     $dumpfile("dump.vcd");  // Specify the dump file name
    $dumpvars(1, testBench_halfAdder_1Bit);  // Dump all variables in the testbench
    
    $monitor($time, " A=%b, B=%b, sum=%b, carry=%b", A, B, sum, carry);
    
    for (i = 0; i < 4; i = i + 1) begin
      {A, B} = i;  // assign binary combinations of A and B
      #10;         // wait for 10 time units
    end
  end
endmodule
