`include "Environment.sv"

module tb;
  reg clock=0;
  
  always #5 clock = ~clock;
  signals sig(clock);
  dff dut(.inf(sig));
  Environment env;
  
  initial begin
    $dumpfile("v.vcd");
    $dumpvars(0,tb);
    env = new(sig);
    env.run();
    #200;
    $finish;
  end
endmodule
