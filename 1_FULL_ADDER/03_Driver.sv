class Driver;
  Transaction tr;
  mailbox #(Transaction) mx;
  virtual full_add fd;
  event drv_done;
  
  function new (mailbox #(Transaction) mx, virtual full_add fd, event drv_done);
    this.mx = mx;
    this.fd = fd;
    this.drv_done = drv_done;
  endfunction
  
  task run();
    
    forever 
      begin
        mx.get(tr);
        fd.a = tr.a;
        fd.b = tr.b;
        fd.cin = tr.cin;

        $display("time =%0t DRIVER , inputs applied",$time);
//         -> drv_done;
        #5;
        -> drv_done;
      end
    
    
  endtask
endclass
