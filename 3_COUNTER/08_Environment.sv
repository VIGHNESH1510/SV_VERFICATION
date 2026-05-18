`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "ScoreBoard.sv"
`include "Monitor.sv"

class Environment;
  
  Transaction tr;
  Generator gen;
  Driver dri;
  Monitor mon;  
  Scoreboard scr;
  
  virtual signals sig;
  event done;
  
  mailbox #(Transaction) gen_dri;
  mailbox #(Transaction) mon_scr;
  
  function new(virtual signals sig);
    gen_dri = new();
    mon_scr = new();
    this.sig = sig;
    
    gen = new(gen_dri, sig);
    dri = new(gen_dri, sig, done);
    mon = new(mon_scr, sig, done);
    scr = new(mon_scr);
    
  endfunction
  
  
  task run();
    fork
      gen.run();
      dri.run();
      mon.run();
      scr.run();
    join_none
  endtask
endclass
