class Driver;
  
  Transaction tr;
  mailbox #(Transaction) gen_dri;
  virtual signals sig;
  
  function new(mailbox #(Transaction) gen_dri, virtual signals sig);
    this.gen_dri = gen_dri;
    this.sig = sig;
  endfunction
  
  
  task run();
    
    forever 
      begin
        gen_dri.get(tr);
        
        @( sig.clk);
        
        sig.clk.d <= tr.d;
        sig.clk.reset <= tr.reset;
        
       // $display("time =%0t Driver , input drived",$time);
        $display("time =%0t DRIVER reset=%b d=%b Q=%b",$time,tr.reset,tr.d,tr.Q);
      end
    
  endtask
endclass
