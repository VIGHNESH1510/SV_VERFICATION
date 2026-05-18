class Monitor;
  Transaction tr;
  mailbox #(Transaction) mon_scr;
  virtual signals sig;
  event done;
  
  function new(mailbox #(Transaction) mon_scr,
               virtual signals sig,
               event done);
    this.mon_scr = mon_scr;
    this.sig     = sig;
    this.done    = done;
  endfunction
  
  task run();
    forever begin
      tr      = new();
      @(posedge sig.clk);
      #1; 
      tr.up_down = sig.up_down;  // read from interface
      tr.rst = sig.rst;  // read rst directly from interface, NOT randomized
      tr.out = sig.out;  // read DUT output
      mon_scr.put(tr);
      $display("[MON] time=%0t rst=%b up_down=%b out=%0d",
                $time, tr.rst, tr.up_down, tr.out);
    end
  endtask
endclass
