`include "Transaction.sv"
`include "Generator.sv"
`include "Read_Driver.sv"
`include "Write_Driver.sv"
`include "Write_Monitor.sv"
`include "Read_Monitor.sv"
`include "ScoreBoard.sv"

class Environment #(parameter width = 8, depth =3);
  
  Transaction tr;
  Generator gen;
  Read_driver r_dri;
  Write_driver w_dri;
  Read_Monitor r_mon;
  Write_Monitor w_mon;
  ScoreBoard scr;
  virtual signals sig;
  
  mailbox #(Transaction) gen_r_dri;
  mailbox #(Transaction) gen_w_dri;
  mailbox #(Transaction) r_mon_scr;
  mailbox #(Transaction) w_mon_scr;
  
  function new(virtual signals sig);
    this.sig = sig;
    gen_r_dri = new();
    gen_w_dri = new();
    r_mon_scr = new();
    w_mon_scr = new();
    
    gen = new(gen_w_dri, gen_r_dri);
    w_dri = new( gen_w_dri , sig);
    r_dri = new( gen_r_dri , sig);

    w_mon = new( w_mon_scr , sig);
    r_mon = new( r_mon_scr , sig);

    scr   = new(w_mon_scr, r_mon_scr);
    
  endfunction
  
  task run();

        fork
          
          gen.run();
          w_dri.run();
          r_dri.run();
          w_mon.run();
          r_mon.run();
          scr.run();
          //scr.report();

        join_none

    endtask

  
endclass
