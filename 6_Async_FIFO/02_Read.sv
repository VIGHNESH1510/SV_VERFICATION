module read_handler #(parameter N=3) (input r_clk, r_en,r_rst_n,input [N:0] wptr_s, output reg empty, output reg [N:0]rptr_b, rptr_g);
wire [N:0]rptr_b_next, rptr_g_next;
wire r_empty;

assign rptr_b_next = rptr_b + (r_en & !empty);
assign rptr_g_next = rptr_b_next ^ (rptr_b_next >> 1);
assign r_empty = (rptr_g_next == wptr_s);

always @(posedge r_clk or negedge r_rst_n)
begin
  if(!r_rst_n)
  begin
    empty <=1;
    rptr_b <=0;
    rptr_g <=0;
  end
  else
  begin
    empty <= r_empty;
    rptr_b <= rptr_b_next;
    rptr_g <= rptr_g_next;
    
  end
end
endmodule
