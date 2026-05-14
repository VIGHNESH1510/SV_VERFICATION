class Scoreboard;
  
  Transaction tr1,tr2;
  mailbox #(Transaction) mx;
  mailbox #(Transaction) scr_exp;
  
  function new (mailbox #(Transaction) mx, mailbox #(Transaction) scr_exp);
    this.mx = mx;
    this.scr_exp = scr_exp;
  endfunction
  
  task run();
    forever 
      begin
        mx.get(tr1);
        scr_exp.get(tr2);
        //$display("scoreBoard a=%b b=%b cin=%b",tr2.a,tr2.b,tr2.cin);
        if(tr2.exp_sum == tr1.sum && tr2.exp_carry == tr1.carry)
          $display("time =%0t TEST CASE PASSED \n",$time);
        else
          $display("time =%0t TEST CASE FAILED \n",$time);
      end
  endtask
endclass
