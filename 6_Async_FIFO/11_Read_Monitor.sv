class Read_Monitor;
  
  Transaction tr;
  mailbox #(Transaction) RM_scr;
  virtual signals sig;
  
  function new(mailbox #(Transaction) RM_scr, virtual signals sig);
    
    this.RM_scr = RM_scr;
    this.sig = sig;
    
  endfunction
  
  task run();
    
    forever begin
      
      tr= new();
      
      @(posedge sig.r_clk);
      #1;
      
      tr.r_en = sig.r_en;
      tr.r_rst = sig.r_rst;
      tr.d_out = sig.d_out;
      tr.empty = sig.empty;
      
      RM_scr.put(tr);
      
      $display("[R_MON] time =%0t | r_rst =%b | r_en =%b | d_out =%0d | empty =%b", $time, sig.r_rst,sig.r_en, sig.d_out, sig.empty);
      
    end
    
  endtask
  
  
endclass
