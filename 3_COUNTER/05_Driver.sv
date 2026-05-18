class Driver;
  Transaction tr;
  mailbox #(Transaction) gen_dri;
  virtual signals sig;
  event done;
  
  function new(
    mailbox #(Transaction) gen_dri,
              virtual signals sig,
              event done);
    
    this.gen_dri = gen_dri;
    this.sig = sig;
    this.done = done;
    
  endfunction
  
  task run();
    forever begin
      
      tr = new();
      gen_dri.get(tr);
      
      @(negedge sig.clk);
      sig.up_down = tr.up_down;
      
      $display("[DRI] time =%0t , up_down =%b",$time,tr.up_down);
    end
  endtask
endclass
