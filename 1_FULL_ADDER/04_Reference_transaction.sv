class Reference;
  
  Transaction tr;
  mailbox #(Transaction) gen_ref;
  mailbox #(Transaction) scr_exp;
  event drv_done;
  
  function new(mailbox #(Transaction) gen_ref, mailbox #(Transaction) scr_exp,  event drv_done);
    
    this.gen_ref = gen_ref;
    this.scr_exp = scr_exp;
    this.drv_done = drv_done;
    
  endfunction
  
  task run();
    
    forever 
      begin
         @(drv_done);
         gen_ref.get(tr);
        //$display("REference a=%b b=%b cin=%b",tr.a,tr.b,tr.cin);
        {tr.exp_carry, tr.exp_sum } = tr.a + tr.b + tr.cin;
        scr_exp.put(tr);
        
      end
    
  endtask
  
endclass
