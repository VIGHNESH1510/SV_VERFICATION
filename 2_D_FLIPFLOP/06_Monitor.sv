class Monitor;
  
  Transaction tr;
  mailbox #(Transaction) mon_scr;
  virtual signals sig;

  function new(mailbox #(Transaction) mon_scr, virtual signals sig);
    this.mon_scr = mon_scr;
    this.sig = sig;
    
  endfunction
  
  task run();
    forever 
      begin
        
        tr =new();
        @( sig.clk);
        #5
        tr.d = sig.d;
        tr.reset = sig.reset;
        tr.Q = sig.q;
        
        mon_scr.put(tr);
        
      end
  endtask
  
  
endclass
