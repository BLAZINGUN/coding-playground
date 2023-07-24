class wr_drv;

//declare packet , mailbox and interface
wr_xtn stim_2_dut_pkt;
virtual fifo_interface.wr_drv_mp wr_drv_inf;
mailbox #(wr_xtn) wr_gen_2_wr_drv_mbx;


//connect the local ones using new function

function new(virtual fifo_interface.wr_drv_mp wr_drv_inf , mailbox #(wr_xtn) wr_gen_2_wr_drv_mbx );

this.wr_drv_inf = wr_drv_inf;
this.wr_gen_2_wr_drv_mbx = wr_gen_2_wr_drv_mbx;

endfunction


virtual task drive();

        @(wr_drv_inf.wr_drv_cb;
        wr_drv_inf.wr_drv_cb.datain <= stim_2_dut_pkt.datain;
        wr_drv_inf.wr_drv_cb.resetn <= stim_2_dut_pkt.resetn;
        wr_drv_inf.wr_drv_cb.wr_enb <= stim_2_dut_pkt.wr_enb;
        wr_drv_inf.wr_drv_cb.wr_reg <= stim_2_dut_pkt.wr_reg;

endtask


virtual task run();
        fork
                begin
                        @(wr_drv_inf.wr_drv_cb)
                        wr_drv_inf.wr_drv_cb.resetn <= 0;
                        forever
                                begin
                                        wr_gen_2_wr_drv_mbx.get(stim_2_dut_pkt);
                                        drive();
                                end
                end
        join_none
endtask


endclass
