class Monitor;
  
  Transaction tr;
  mailbox #(Transaction) mx;
  virtual full_add fd;
  event drv_done;
  
  function new (mailbox #(Transaction) mx, virtual full_add fd,event drv_done);
    this.mx = mx;
    this.fd = fd;
    this.drv_done = drv_done;
  endfunction
  
  task run();
    forever 
      begin
        tr = new();
        @(drv_done);
        //#1;
        tr.a = fd.a;
        tr.b = fd.b;
        tr.cin = fd.cin;
        tr.sum = fd.sum;
        tr.carry = fd.carry;
        tr.display("Monitor");
        mx.put(tr);
        
      end
  endtask
endclass
