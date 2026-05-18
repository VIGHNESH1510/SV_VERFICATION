
`include "Environment.sv"

module tb;
  signals sig();
  Environment env;
  
  up_down_counter dut(.sig(sig));
  
  always #5 sig.clk = ~sig.clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  
    sig.clk =0;
    sig.rst = 1;
    repeat(2) @(posedge sig.clk);  
    
    env = new(sig);
    env.run();
    
    sig.rst = 0;
    #50;
    
    sig.rst = 1;
    #10;
    sig.rst = 0;
    
    #100;
    env.scr.report();
    $finish;
  end
endmodule
