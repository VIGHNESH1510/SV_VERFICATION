include "Transaction.sv"
`include "Generator.sv"
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"
`include "Reference.sv"

class Environment;
  Generator gen;
  Driver dri;
  Monitor mon;
  Scoreboard scr;
  Reference rfr;
  
  mailbox #(Transaction) gen_dri;
  mailbox #(Transaction) gen_ref;
  mailbox #(Transaction) ref_scr;
  mailbox #(Transaction) mon_scr;
  
  virtual full_add fd;
  event drv_done;
  
  function new(virtual full_add fd);
    this.fd = fd;
    gen_dri = new();
    gen_ref = new();
    ref_scr = new();
    mon_scr = new();
    
    gen = new(gen_dri,gen_ref);
    dri = new(gen_dri,fd,drv_done);
    rfr = new(gen_ref, ref_scr,drv_done);
    mon = new(mon_scr,fd,drv_done);
    scr = new(mon_scr,ref_scr);
  endfunction
  
  task run();
    fork
      gen.run();
      rfr.run();
      dri.run();
      mon.run();
      scr.run();
    join_none
  endtask
  
endclass
