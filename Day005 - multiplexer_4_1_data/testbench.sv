// Code your testbench here
// or browse Examples
module testBench_multiplexer_4_1_data();
  // input decleration
  reg S0,S1,I0,I1,I2,I3;
  
  //output decleration
  wire Y;
  
  // instantiation
  multiplexer_4_1_data mux_4_1(Y,S1,S0,I0,I1,I2,I3);
  
  // stimulation block
  initial begin
    // initialising reg
    S0=0;S1=0;I0=1;I1=0;I2=1;I3=0;
    
    // creating dumpfile
    $dumpfile("dump.vcd");
    $dumpvars(1,testBench_multiplexer_4_1_data);
    
    // monitoring changing variables
    $monitor($time,"S0=%b,S1=%b,Y=%b",S0,S1,Y); 
    
    // Apply different input combinations with a small delay between each step
    S1=0;S0=0;#5;
    S1=0;S0=1;#5;
    S1=1;S0=0;#5;
    S1=1;S0=1;#5;
    
    $finish;
    
  end
  
endmodule