class generator;
  
  transaction tr;
  mailbox #(transaction) gen_dri;
  
  function new( mailbox #(transaction) gen_dri);
    this.gen_dri = gen_dri;
  endfunction
  
  task run();

    
    forever begin

    // Write A
    tr = new();
    tr.read_write = 0;
    tr.address = 8'h00;
    assert(tr.randomize());
    gen_dri.put(tr);
      $display("\n[%0t][GEN] WRITE  ADDR=%h DATA=%0d",
                $time,tr.address,tr.data);


    // Write B
    tr = new();
    tr.read_write = 0;
    tr.address = 8'h04;
    assert(tr.randomize());
    gen_dri.put(tr);
    $display("[%0t][GEN] WRITE  ADDR=%h DATA=%0d",
                $time,tr.address,tr.data);


    // Write Opcode
    tr = new();
    tr.read_write = 0;
    tr.address = 8'h08;
    assert(tr.randomize() with { data inside {[0:6]}; });
    gen_dri.put(tr);
    $display("[%0t][GEN] WRITE  ADDR=%h OPCODE=%0d",
                $time,tr.address,tr.data);

    // Read Result
    tr = new();
    tr.read_write = 1;
    tr.address = 8'h0C;
    gen_dri.put(tr);
    $display("[%0t][GEN] READ   ADDR=%h (RESULT)",
                $time,tr.address);

    // Read Flag
    tr = new();
    tr.read_write = 1;
    tr.address = 8'h10;
    gen_dri.put(tr);
    $display("[%0t][GEN] READ   ADDR=%h (FLAG)\n",
                $time,tr.address);
      
      #50;

	end
    
  endtask
  
endclass

