class ScoreBoard #(parameter width=8, depth=3);

    Transaction tr1, tr2;

    mailbox #(Transaction) WM_scr;
    mailbox #(Transaction) RM_scr;

    bit [width-1:0] fifo_q[$];
    bit [width-1:0] expected_data;

    bit exp_full, exp_empty;

    int pass, fail;

    function new(mailbox #(Transaction) WM_scr,
                 mailbox #(Transaction) RM_scr);

        this.WM_scr = WM_scr;
        this.RM_scr = RM_scr;

        pass = 0;
        fail = 0;

    endfunction

task run();

    fork

        // Write thread
        forever begin
            WM_scr.get(tr1);

            if (tr1.w_en && !tr1.full) begin
                fifo_q.push_back(tr1.d_in);

                $display("[SB] WRITE : %0h  Queue=%0d",
                         tr1.d_in, fifo_q.size());
            end
        end

        // Read thread
        forever begin
            RM_scr.get(tr2);

            if (tr2.r_en && fifo_q.size() > 0) begin

                expected_data = fifo_q.pop_front();

                if (expected_data === tr2.d_out) begin
                    pass++;
                    $display("[SB PASS] Expected=%0h Received=%0h",
                              expected_data, tr2.d_out);
                end
                else begin
                    fail++;
                    $display("[SB FAIL] Expected=%0h Received=%0h",
                              expected_data, tr2.d_out);
                end
            end
        end

    join

endtask

    function void report();

        $display("--------------------------");
        $display("PASS = %0d", pass);
        $display("FAIL = %0d", fail);
        $display("--------------------------");

    endfunction

endclass
