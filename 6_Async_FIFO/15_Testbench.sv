`include "Environment.sv"
`include "Interface.sv"

module tb #(parameter width =8 , depth =3 );
  
  signals sig();
  Environment env;
  
  topModule dut (
    .w_clk(sig.w_clk),
    .r_clk(sig.r_clk),
    .w_en(sig.w_en),
    .r_en(sig.r_en),
    .r_rst_n(sig.r_rst),
    .w_rst_n(sig.w_rst),
    .d_in(sig.d_in),
    .d_out(sig.d_out),
    .full(sig.full),
    .empty(sig.empty)
  );
  
  always #5 sig.w_clk = ~sig.w_clk;
  always #10 sig.r_clk = ~sig.r_clk;
  
  initial begin

        sig.w_clk = 0;
        sig.r_clk = 0;

        sig.w_rst = 0;
        sig.r_rst = 0;

        sig.w_en = 0;
        sig.r_en = 0;
        sig.d_in = 0;

        #20;

        sig.w_rst = 1;
        sig.r_rst = 1;

   
        env = new(sig);

        env.run();

        #200;

        env.scr.report();

        $finish;

    end
  
  
endmodule
