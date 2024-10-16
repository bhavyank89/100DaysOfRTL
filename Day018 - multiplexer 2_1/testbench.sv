// Code your testbench here
// or browse Examples
module testBench_mux_2_1();
  reg S0,I0,I1;
  wire Y;
  
  mux_2_1 mux21(Y,I0,I1,S0);
  
  initial begin
    S0=0;I0=1;I1=0;
    
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_mux_2_1);
    
    $monitor($time," I0 = %b,I1 = %b,SO = %b,Y = %b",I0,I1,S0,Y);
    
    #5;S0 = 0;
    #5;S0 = 1;
  end
  
endmodule