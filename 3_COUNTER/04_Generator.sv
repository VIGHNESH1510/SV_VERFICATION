class Generator;
  Transaction tr;
  mailbox #(Transaction) gen_dri;
  virtual signals sig;
  function new( mailbox #(Transaction) gen_dri, virtual signals sig);
    this.gen_dri = gen_dri;
    this.sig = sig;
  endfunction
  
  task run();
    forever
      begin
        tr = new();
        
        void '(tr.randomize());
        gen_dri.put(tr);
        $display("[GEN] time=%0t up_down=%b ", $time, tr.up_down);
        @(posedge sig.clk);
      end
  endtask
  
endclass
