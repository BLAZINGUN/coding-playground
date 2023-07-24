class wr_gen;

wr_xtn wr_gen_pkt;
wr_xtn stim_2_dut;

mailbox #(wr_xtn) wr_gen_2_wr_mon_mbx;

function new(mailbox #(wr_xtn) wr_gen_2_wr_drv);

this.wr_gen_2_wr_drv_mon_mbx = wr_gen_2_wr_drv_mbx;
wr_gen_pkt = new();

endfunction


virtual task run();
        fork
                forever
                        begin
                                assert(wr_gen_pkt.randomize());
                                stim_2_dut = new wr_gen_pkt;
                                wr_gen_2_wr_drv_mbx.put(stim_2_dut);
                        end
        join_none

endtask

endclass
