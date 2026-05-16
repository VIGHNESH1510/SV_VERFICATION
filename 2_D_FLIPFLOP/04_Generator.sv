class Generator;
  
  Transaction tr1,tr2;
  mailbox #(Transaction) gen_dri;
  mailbox #(Transaction) gen_ref;
  virtual signals sig;
  
  function new(mailbox #(Transaction) gen_dri, mailbox #(Transaction) gen_ref, virtual signals sig);
    this.gen_dri = gen_dri;
    this.gen_ref = gen_ref;
    this.sig = sig;
  endfunction
  
  task run();
    forever 
      begin
        tr1 = new();
        tr2 = new();
        @(sig.clk);
        void '(tr1.randomize());
//         $display("Generator , input randomized");
        gen_dri.put(tr1);
        gen_ref.put(tr1);
//         #10;
        $display("time= %0t Generator , input randomized",$time);
        
      end
  endtask
  
endclass
