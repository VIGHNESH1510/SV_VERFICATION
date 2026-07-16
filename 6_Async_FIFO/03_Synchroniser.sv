module synchroniser #(parameter N=3)(input clk,reset_n,input [N:0]d_in,output reg [N:0]d_out);
reg [N:0]q;
always @(posedge clk or negedge reset_n)
begin
  if(!reset_n)
  begin
    q <= 0;
    d_out <=0;
  end
  else
  begin
    q <= d_in;
    d_out <=q;
  end
end
endmodule
