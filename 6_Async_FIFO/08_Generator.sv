class Generator;
  
  Transaction tr;
  mailbox #(Transaction) gen_WD;
  mailbox #(Transaction) gen_RD;
  
  function new(mailbox #(Transaction) gen_WD, mailbox #(Transaction) gen_RD);
    
    this.gen_RD = gen_RD;
    this.gen_WD = gen_WD;
    
  endfunction
  
  task run();
    
    forever 
      begin
        
        tr = new();
        void '(tr.randomize());
        gen_RD.put(tr);
        gen_WD.put(tr);
        $display("[GEN] time =%0t",$time);
        #2;
      end
        
  endtask
      
endclass
