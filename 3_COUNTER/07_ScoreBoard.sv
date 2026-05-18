class Scoreboard;
  Transaction tr;    
  mailbox #(Transaction) mon_scr;
  bit [3:0] expected;
  int pass_count = 0;
  int fail_count = 0;
  
  function new(mailbox #(Transaction) mon_scr);
    this.mon_scr = mon_scr;
    expected     = 0;
    
  endfunction
  
  task run();
    forever begin
      mon_scr.get(tr);
      
      if(tr.rst) begin
        expected = 0;
        $display("[SCB] time=%0t RESET detected , expected=0", $time);
      end
      else begin
        if(tr.up_down)
          expected++;
        else
          expected--;
      end
      

      $display("[SCB] time=%0t rst=%b up_down=%b expected=%0d actual=%0d",
                $time, tr.rst, tr.up_down, expected, tr.out);
      
      if(expected == tr.out) begin
        $display("[PASS] \n");
        pass_count++;
      end
      else begin
        $display("[FAIL]  got=%0d expected=%0d\n", tr.out, expected);
        fail_count++;
      end
      
    end
  endtask
  
  function void report();
    $display("==============================");
    $display("  TOTAL PASSED : %0d", pass_count);
    $display("  TOTAL FAILED : %0d", fail_count);
    $display("==============================");
  endfunction
endclass
