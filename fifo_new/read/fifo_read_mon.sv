class rd_mon;

virtual fifo_interface.rd_mon__mp rd_mon_inf;


rd_xtn rd_mon_pkt;
rd_xtn rd_mon_2_rm_pkt;
rd_xtn rd_mon_2_sb_pkt;

mailbox #(rd_xtn) rd_mon_2_rm_mbx;
mailbox #(rd_xtn) rd_mon_2_sb_mbx;


function new(virtual fifo_interface.rd_mon_mp rd_mon_inf , mailbox #(rd_xtn) rd_mon_2_sb_mbx , mailbox #(rd_xtn) rd_mon_2_rm_mbx);

this.rd_mon_inf = rd_mon_inf;
this.rd_mon_2_sb_mbx = rd_mon_2_sb_mbx;
this.rd_mon_2_rm_mbx = rd_mon_2_rm_mbx;
rd_mon_pkt = new();

endfunction


virtual task collect_data();

        rd_mon_pkt.rd_reg = rd_mon_inf.rd_mon_cb.rd_reg;
        rd_mon_pkt.rd_enb = rd_mon_inf.rd_mon_cb.rd_enb;

        @(rd_mon_inf.rd_mon_cb);

        rd_mon_pkt.dataout = md_mon_inf.rd_mon_cb.dataout;
        rd_mon_pkt.full = rd_mon_inf.rd_mon_cb.full;
        rd_mon_pkt.empty = rd_mon_inf.rd_mon_cb.empty;
        rd_mon_pkt.threshold = rd_mon_inf.rd_mon_cb.threshold;
        rd_mon_pkt.over_flow = rd_mon_inf.rd_mon_cb.over_flow;
        rd_mon_pkt.underflow = rd_mon_inf.rd_mon_cb.underflow;

        $display("READ MONITOR HAS COLLECTED THE ABOVE VALUES");

endtask


virtual task run();

        fork
                begin

                        repeat(2)
                                @(rd_mon_inf.rd_mon_cb)

                forever
                        begin
                                collect_data();
                                rd_mon_2_sb_pkt = new rd_mon_pkt;
                                rd_mon_2_rm_pkt = new rd_mon_pkt
                        end


        join_none


endtask

endclass
