interface signals  #(parameter w=8 ,d=3) ();
  logic w_clk,r_clk,w_en,r_en,r_rst,w_rst;
  logic [d:0]d_in;
  logic [d:0]d_out;
  logic full,empty;
endinterface
