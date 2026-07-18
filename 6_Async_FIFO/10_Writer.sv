class Write_driver;
  
  Transaction tr;
  mailbox #(Transaction) gen_WD;
  virtual signals sig;
  
  function new(mailbox #(Transaction) gen_WD, virtual signals sig);
    
    this.gen_WD = gen_WD;
    this.sig = sig;
    
  endfunction
  
  
  task run();
    
    forever begin
      //tr = new();
      @(negedge sig.w_clk);

      gen_WD.get(tr);
      sig.w_en <= tr.w_en;
      //sig.w_rst <= tr.w_rst;
      sig.d_in <= tr.d_in;
      
      $display("[W_DRI] time =%0t | w_rst =%b | w_en =%b",$time,tr.w_rst, tr.w_en);
    end
    
  endtask
endclass
