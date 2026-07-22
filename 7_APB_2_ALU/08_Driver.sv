
class driver;

  mailbox #(transaction) gen_dri;
  virtual signals sig;
  transaction tr;

  function new(mailbox #(transaction) gen_dri,
               virtual signals sig);
    this.gen_dri = gen_dri;
    this.sig     = sig;
  endfunction

  // Reset
  task reset();

    sig.PRESETn      = 0;
    sig.transfer     = 0;
    sig.READ_WRITE   = 0;
    sig.apb_write_add  = 0;
    sig.apb_read_add   = 0;
    sig.apb_write_data = 0;

    repeat(2)
      @(posedge sig.PCLK);

    sig.PRESETn = 1;

    $display("[%0t][DRI] RESET COMPLETE",$time);

  endtask

    task write(input bit [7:0] addr);

    // Drive request
    sig.apb_write_data = tr.data;
    sig.apb_write_add  = addr;
    sig.READ_WRITE     = 0;
    sig.transfer       = 1;

    // Wait for SETUP phase
    @(posedge sig.PCLK);
    wait(sig.PSELx && !sig.PENABLE);

    // Wait for ACCESS phase
    @(posedge sig.PCLK);
    wait(sig.PSELx && sig.PENABLE);

    // Wait for transfer completion
    wait(sig.PREADY);

    // Keep request stable until the transfer is completed
    @(posedge sig.PCLK);

    // Remove request only after APB transaction is complete
    sig.transfer = 0;

  endtask

    // READ
    task read(input bit [7:0] addr);

    sig.apb_read_add = addr;
    sig.READ_WRITE   = 1;
    sig.transfer     = 1;

    $display("[%0t][DRI] READ ADDR=%h",
             $time, addr);

    // Wait for SETUP
    @(posedge sig.PCLK);
    wait(sig.PSELx && !sig.PENABLE);

    // Wait for ACCESS
    @(posedge sig.PCLK);
    wait(sig.PSELx && sig.PENABLE);

    // Wait for transfer completion
    wait(sig.PREADY);

    // Allow monitor to sample the completed transfer
    @(posedge sig.PCLK);

    $display("[%0t][DRI] READ DATA=%0d",
             $time,
             sig.apb_read_data_out);

    sig.transfer = 0;

  endtask


  task run();

    //$display("[DRI] run() entered");

    reset();

    forever begin

      gen_dri.get(tr);

      $display("[%0t][DRI] GOT: RW=%0d ADDR=%h DATA=%0d \n",
               $time, 
               tr.read_write, 
               tr.address, 
               tr.data);

      if(tr.read_write)
        read(tr.address);
      else
        write(tr.address);

    end

  endtask

endclass
