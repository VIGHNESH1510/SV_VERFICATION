module memory #(parameter w=8 ,d=3) (input w_clk,r_clk,w_en,r_en,full,empty,input [d:0]wptr_b,rptr_b,input [d:0]d_in,output [d:0]d_out);
  reg [d:0]mem[w-1:0];
always @(posedge w_clk)
begin
  if(w_en && !full)
  begin
    mem[wptr_b[d-1:0]] <= d_in;
    
  end
end
  
assign d_out = mem[rptr_b[d:0]];
  
endmodule
