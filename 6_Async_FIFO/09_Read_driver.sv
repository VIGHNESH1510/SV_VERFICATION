class Read_driver;
  
  Transaction tr;
  mailbox #(Transaction) gen_RD;
  virtual signals sig;
  
  function new(mailbox #(Transaction) gen_RD, virtual signals sig);
    
    this.gen_RD = gen_RD;
    this.sig = sig;
    
  endfunction
  
  
  task run();
    
    forever begin
      tr = new();
      @(negedge sig.r_clk);
      
      gen_RD.get(tr);
      sig.r_en <= tr.r_en;
      //sig.r_rst <= tr.r_rst;
      $display("[R_DRI] time =%0t , r_rst =%b r_en =%b",$time,tr.r_rst, tr.r_en);
    end
    
  endtask
endclass
