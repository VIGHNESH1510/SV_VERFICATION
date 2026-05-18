`include "Interface.sv"
module up_down_counter(signals sig);
  
  always @(posedge sig.clk or posedge sig.rst)
    begin
      if(sig.rst)
        sig.out <= 0;
      else begin
        if(sig.up_down)
       		sig.out <= sig.out+1;
        else
          sig.out <= sig.out-1;
        
      
      end
    end
endmodule
