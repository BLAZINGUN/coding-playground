class rd_drv;

//declaring xtn pkt,mailbox,inteface

rd_xtn stim_2_dut_pkt;
virtual fifo_interface.rd_drv_mp rd_drv_inf;
mailbox #(rd_xtn) rd_gen_2_rd_drv_mbx;


//connecting local ones using new function

function new(virtual fifo_interface.rd_drv_mp rd_drv_inf , mailbox #(rd_xtn) rd_gen_2_rd_drv_mbx);

this.rd_gen_2_rd_drv_mbx = rd_gen_2_rd_drv_mbx;
this.rd_drv_inf = rd_drv_inf;

endfunction


virtual task drive();
        @(rd_drv_inf.rd_drv_cb);
        rd_drv_inf.rd_drv_cb.rd_reg <= stim_2_dut_pkt.rd_reg;
        rd_drv_inf.rd_drv_cb.rd_enb <= stim_2_dut_pkt.rd_enb;
endtask


virtual task run();
        fork
                forever
                        begin
                                rd_gen_2_rd_drv_mbx.get(stim_2_dut_pkt);
                                drive();
                        end
        join_none
endtask


endclass
