class wr_mon;

wr_xtn wr_mon_pkt;

virtual fifo_interface.wr_mon_mp wr_mon_inf;

mailbox #(wr_xtn) wr_mon_2_sb_mbx;
mailbox #(wr_xtn) wr_mon_2_rm_mbx;


function new( virtual fifo_interface.wr_mon_mp wr_mon_inf , mailbox #(wr_xtn) wr_mon_2_sb_mbx , mailbox #(wr_xtn) wr_mon_2_rm_mbx );

this.wr_mon_inf = wr_mon_inf;
this.wr_mon_2_sb_mbx = wr_mon_2_sb_mbx;
this.wr_mon_2_rm_mbx = wr_mon_2_rm_mbx;
wr_mon_pkt = new();

endfunction



virtual task collect_data();

        @(wr_mon_inf.wr_mon_cb)
        wr_mon_pkt.datain = wr_mon_inf.wr_mon_cb.datain;
        wr_mon_pkt.resetn = wr_mon_inf.wr_mon_cb.resetn;
        wr_mon_pkt.wr_enb = wr_mon_inf.wr_mon_cb.wr_enb;
        wr_mon_pkt.wr_reg = wr_mon_inf.wr_mon_cb.wr_reg;

endtask


virtual task run();

fork
        begin
                @(wr_mon_inf.wr_mon_cb)
                        begin
                                forever
                                        begin

                                        collect_data();
                                        wr_mon_2_sb_mbx.put(wr_mon_pkt);
                                        wr_mon_2_rm_mbx.put(wr_mon_pkt);

                                        end

                        end

        end


join_none


endtask

endclass
