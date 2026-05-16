
`include "Interface.sv"
module dff(signals inf);
  always @(posedge inf.clock)
    begin
      if(inf.reset)
        inf.q <= 0;
      else
        inf.q <= inf.d;
    end
endmodule
