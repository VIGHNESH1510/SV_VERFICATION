class monitor;

  virtual signals sig;
  mailbox #(transaction) mon_scr;

  transaction tr;

  function new(mailbox #(transaction) mon_scr,
               virtual signals sig);

    this.mon_scr = mon_scr;
    this.sig     = sig;

  endfunction


  task run();

    forever begin

      // Wait for the APB clock
      @(posedge sig.PCLK);
      #1;

      // A transfer is complete only in ACCESS phase
      // when PREADY is asserted
      if(sig.PSELx && sig.PENABLE && sig.PREADY)
      begin

        tr = new();

        // Get transaction information from APB bus
        tr.address    = sig.PADDR;
        tr.read_write = !sig.PWRITE;

        if(sig.PWRITE)
        begin

          // WRITE transaction
          tr.data = sig.PWDATA;

          $display("[%0t][MON] WRITE ADDR=%h DATA=%0d",
                   $time,
                   tr.address,
                   tr.data);
        end

        else
        begin

          // READ transaction
          tr.data = sig.PRDATA;

          $display("[%0t][MON] READ  ADDR=%h DATA=%0d",
                   $time,
                   tr.address,
                   tr.data);
        end

        // Send completed APB transaction to scoreboard
        mon_scr.put(tr);

      end

    end

  endtask

endclass
