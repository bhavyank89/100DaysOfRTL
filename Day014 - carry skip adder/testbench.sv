module testbench;

  reg [3:0] A, B;
  reg cin;
  wire [3:0] sum;
  wire carryOut;

  // Instantiate the carry_select_adder_4Bit module
  carry_select_adder_4Bit uut (
    .A(A),
    .B(B),
    .cin(cin),
    .sum(sum),
    .carryOut(carryOut)
  );

  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1,testbench);
    
    // Set up $monitor to automatically print values whenever they change
    $monitor("Time=%0t | A=%b | B=%b | cin=%b | sum=%b | carryOut=%b", 
             $time, A, B, cin, sum, carryOut);

    A = 4'b0000; B = 4'b0000; cin = 0;
    #10;

    A = 4'b0101; B = 4'b0011; cin = 0;
    #10;

    A = 4'b0101; B = 4'b0011; cin = 1;
    #10;

    A = 4'b1111; B = 4'b0001; cin = 0;
    #10;

    A = 4'b1111; B = 4'b0001; cin = 1;
    #10;

    A = 4'b1010; B = 4'b1010; cin = 1;
    #10;


    A = 4'b1100; B = 4'b1010; cin = 1;
    #10;


    $finish;
  end

endmodule
