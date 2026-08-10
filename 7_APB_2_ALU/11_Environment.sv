`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"


class environment;
  
  transaction tr;
  generator gen;
  driver dri;
  monitor mon;
  scoreboard scr;
  virtual signals sig;
  
  mailbox #(transaction) gen_dri;
  mailbox #(transaction) mon_scr;
  
  function new(virtual signals sig);
    this.sig = sig;
    
    gen_dri = new();
    mon_scr = new();
    
    gen = new(gen_dri);
    dri = new(gen_dri, sig);
    mon = new(mon_scr, sig);
    scr = new(mon_scr, sig);
    
    
  endfunction
  
  task run();
    fork 
      $display("[%0t][ENV] Environment Created",$time);
      gen.run();
      dri.run();
      mon.run();
      scr.run();
      
     
    join_any
      
  endtask
  
endclass
