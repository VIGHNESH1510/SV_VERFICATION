class Scoreboard;
  Transaction tr;
  Transaction prev_tr;
  mailbox #(Transaction) mon_scr;
  
  function new(mailbox #(Transaction) mon_scr);
    this.mon_scr = mon_scr;
  endfunction
  
  task run();
    forever begin
      mon_scr.get(tr);
      
      if(prev_tr == null) begin
        prev_tr = tr;
        continue;
      end
      
      if(prev_tr.reset == 1) begin
        $display("time=%0t [SCB] Checking RESET | prev_reset=%b | curr_Q=%b", 
                  $time, prev_tr.reset, tr.Q);
        if(tr.Q == 0)
          $display("time=%0t [SCB] Reset case PASSED\n", $time);
        else
          $display("time=%0t [SCB] Reset case FAILED\n", $time);
      end
      else begin
        $display("time=%0t [SCB] Checking D==Q | prev_d=%b | curr_Q=%b", 
                  $time, prev_tr.d, tr.Q);
        if(tr.Q == prev_tr.d)
          $display("time=%0t [SCB] D==Q PASSED\n", $time);
        else
          $display("time=%0t [SCB] D!=Q FAILED\n", $time);
      end
      
      prev_tr = tr;
    end
  endtask

endclass
