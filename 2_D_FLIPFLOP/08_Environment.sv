`include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "ScoreBoard.sv"

class Environment;
  
  Transaction tr;
  Generator gen;
  Driver dri;
  Monitor mon;
  Scoreboard scr;
  
  mailbox #(Transaction) gen_dri;
  mailbox #(Transaction) mon_scr;
  mailbox #(Transaction) gen_ref;
  mailbox #(Transaction) ref_scr;
  virtual signals sig;
  
  function new(virtual signals sig);
    this.sig = sig;
    gen_dri = new();
    mon_scr = new();
    gen_ref = new();
    ref_scr = new();
    gen = new(gen_dri, gen_ref, sig);
    dri = new(gen_dri, sig);
    mon = new(mon_scr, sig);
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
