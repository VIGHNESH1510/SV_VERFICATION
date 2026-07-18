class Write_Monitor;
  
  Transaction tr;
  mailbox #(Transaction) WM_scr;
  virtual signals sig;
  
  function new(mailbox #(Transaction) WM_scr, virtual signals sig);
    
    this.WM_scr = WM_scr;
    this.sig = sig;
    
  endfunction
  
  task run();
    
    forever begin
      
      tr= new();
      
      @(posedge sig.w_clk);
      #1;
      
      tr.w_en = sig.w_en;
      tr.w_rst = sig.w_rst;
      tr.d_in = sig.d_in;
      tr.full = sig.full;
      
      WM_scr.put(tr);
      
      $display("[W_MON] time =%0t | w_rst =%b | w_en =%b | d_in =%0d | full =%b", $time, sig.w_rst,sig.w_en, sig.d_in, sig.full);
      
    end
    
  endtask
  
  
endclass
