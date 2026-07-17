class Transaction #(parameter d=4);
   rand bit w_en, r_en;
   bit r_rst, w_rst;
  rand bit[d-1:0] d_in;
  bit [d-1:0] d_out;
  bit full,empty;
  
  constraint wr_constraint {
  {w_en, r_en} dist {
    2'b00 := 1,
    2'b01 := 4,
    2'b10 := 4,
    2'b11 := 1
  };
  
  
endclass
