module write_handler #(parameter depth=3)
(input w_clk,w_rst_n,w_en,
  input [depth:0]rptr_s, 
  output reg [depth:0]wptr_b,wptr_g,
  output reg full);

wire [depth:0]wptr_b_next , wptr_g_next;
wire wfull;

assign wptr_b_next = wptr_b +(w_en & !full);
assign wptr_g_next = wptr_b_next ^ (wptr_b_next >>1);
assign wfull = (wptr_g_next == {~rptr_s[depth:depth-1], rptr_s[depth-2:0]});

always @(posedge w_clk or negedge w_rst_n)
begin
  if(!w_rst_n)
  begin
    full <=0;
    wptr_b <=0;
    wptr_g <=0;
  end
  else
  begin
    wptr_b <= wptr_b_next;
    wptr_g <= wptr_g_next;
    full <= wfull;
    
  end
end

endmodule
