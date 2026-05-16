interface signals(input bit clock);
  logic d,reset=1;
  logic q;
  clocking clk @(posedge clock);
    default input #1step output #0;  
    output  d,reset; 
    input q; 
  endclocking
endinterface
