`include "Interface.sv"
module full_adder(full_add fa);
  always @(*)
    begin
      fa.sum = fa.a ^ fa.b ^ fa.cin;
      fa.carry = (fa.a & fa.b) | fa.cin & (fa.a ^ fa.b);
    end
endmodule
