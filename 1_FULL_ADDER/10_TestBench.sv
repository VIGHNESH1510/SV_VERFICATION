`include "Environment.sv"
module tb;
  full_add fb();

  Environment env;

  full_adder dut(.fa(fb));
  
  
  initial
    begin
      env = new(fb);

      env.run();

      #100;
      $finish;

    end
  
endmodule
