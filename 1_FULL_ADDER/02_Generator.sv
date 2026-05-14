class Generator;
  
  Transaction tr1,tr2;
  mailbox #(Transaction) mb;
  mailbox #(Transaction) rf;
  
  function new (mailbox #(Transaction) mb, mailbox #(Transaction) rf);
    this.mb = mb;
    this.rf = rf;
  endfunction
  
  task run();
    
//     repeat(10)
    forever
      begin
        tr1 = new();
        tr2 = new();
        void'(tr1.randomize());
        tr2.a   = tr1.a;
        tr2.b   = tr1.b;
        tr2.cin = tr1.cin;
        tr1.display("GENERATOR");
        mb.put(tr1);
        rf.put(tr2);
        #5;
      end
    
  endtask
  
endclass
