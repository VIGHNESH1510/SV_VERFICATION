`include "read.sv"
`include "write.sv"
`include "memory.sv"
`include "sync.sv"

module topModule #(parameter w=8 ,d=3) (
  input w_clk,r_clk,w_en,r_en,r_rst_n,w_rst_n,
  input [d:0]d_in,
  output [d:0]d_out,
  output full,empty);
  
  
wire [d:0] wptr_b,wptr_g,rptr_b,rptr_g, wptr_s,rptr_s;
//wire empty,full;

read_handler r1(.r_clk(r_clk),
                .r_en(r_en),
                .r_rst_n(r_rst_n),
                .wptr_s(wptr_s),
                .empty(empty),
                .rptr_b(rptr_b),
                .rptr_g(rptr_g));
  
  

write_handler w1(.w_clk(w_clk),
                 .w_en(w_en),
                 .w_rst_n(w_rst_n),
                 .rptr_s(rptr_s),
                 .full(full),
                 .wptr_b(wptr_b),
                 .wptr_g(wptr_g));
  
  

// Read synchroniser
synchroniser rd(.clk(r_clk),
                .reset_n(r_rst_n),
                .d_in(wptr_g),
                .d_out(wptr_s));

  
  
// write synchroniser
synchroniser wr(.clk(w_clk),
                .reset_n(w_rst_n),
                .d_in(rptr_g),
                .d_out(rptr_s));

memory m(.w_clk(w_clk),
         .r_clk(r_clk),
         .w_en(w_en),
         .r_en(r_en),
         .full(full),
         .empty(empty),
         .wptr_b(wptr_b),
         .rptr_b(rptr_b),
         .d_in(d_in),
         .d_out(d_out));
  
  
endmodule
