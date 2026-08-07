class scoreboard;

  transaction tr;
  mailbox #(transaction) mon_scr;
  virtual signals sig;

  // Stored operands
  bit [7:0] A_r;
  bit [7:0] B_r;
  bit [7:0] opcode_r;

  // Expected values
  bit [7:0] exp_result;
  bit [7:0] exp_flag;

  function new(mailbox #(transaction) mon_scr,
               virtual signals sig);

      this.mon_scr = mon_scr;
      this.sig     = sig;

  endfunction


  task run();

      forever begin

          mon_scr.get(tr);

          // WRITE transactions
          if(!tr.read_write)
          begin

              case(tr.address)

                  8'h00:
                  begin
                      A_r = tr.data;
                      $display("[%0t][SB ] STORED A      = %0d",
                                $time,A_r);
                  end

                  8'h04:
                  begin
                      B_r = tr.data;
                      $display("[%0t][SB ] STORED B      = %0d",
                                $time,B_r);
                  end

                  8'h08:
                  begin
                      opcode_r = tr.data;
                      $display("[%0t][SB ] STORED OPCODE = %0d",
                                $time,opcode_r);
                  end

              endcase

          end

          // READ transactions
          else
          begin

         
              exp_flag = 0;

              case(opcode_r[2:0])

                  3'd0: {exp_flag[0],exp_result} = A_r + B_r;
                  3'd1: {exp_flag[1],exp_result} = A_r - B_r;
                  3'd2: exp_result = ~A_r;
                  3'd3: exp_result = A_r | B_r;
                  3'd4: exp_result = A_r ^ B_r;
                  3'd5: exp_result = A_r >> 1;
                  3'd6: exp_result = B_r << 1;
                  default: exp_result = 0;

              endcase

              // RESULT comparison
              if(tr.address == 8'h0C)
              begin

                  $display("----------------------------------------");
                  $display("[%0t][SB ] RESULT CHECK",$time);
                  $display("A        = %0d",A_r);
                  $display("B        = %0d",B_r);
                  $display("OPCODE   = %0d",opcode_r);
                  $display("Expected = %0d",exp_result);
                  $display("Actual   = %0d",tr.data);

                  if(exp_result == tr.data)
                      $display("[%0t][SB ] RESULT PASS",$time);
                  else
                      $display("[%0t][SB ] RESULT FAIL",$time);
                $display("----------------------------------------");

              end


              
              // FLAG comparison
              if(tr.address == 8'h10)
              begin

                  $display("----------------------------------------");
                  $display("[%0t][SB ] FLAG CHECK",$time);
                  $display("Expected = %0d",exp_flag);
                  $display("Actual   = %0d",tr.data);

                  if(exp_flag == tr.data)
                      $display("[%0t][SB ] FLAG PASS",$time);
                  else
                      $display("[%0t][SB ] FLAG FAIL",$time);

                  $display("----------------------------------------");

              end

          end

      end

  endtask

endclass
