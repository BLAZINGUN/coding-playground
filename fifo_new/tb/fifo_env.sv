class fifo_env;

//declaring interfaces
virtual fifo_if.WR_DRV wr_drv_inf;
virtual fifo_if.WR_MON wr_mon_inf;
virtual fifo_if.RD_RDV rd_drv_inf;
virtual fifo_if.RD_MON rd_mon_inf;



//declare the mailboxes
mailbox #(wr_xtn) wr_gen_2_wr_drv_mbx = new();
mailbox #(rd_xtn) rd_gen_2_rd_drv_mbx = new();

mailbox #(wr_xtn) wr_mon_2_rm_mbx = new();
mailbox #(wr_xtn) wr_mon_2_sb_mbx = new();

mailbox #(rd_xtn) rd_mon_2_rm_mbx = new();
mailbox #(rd_xtn) rd_mon_2_sb_mbx = new();

mailbox #(rd_xtn) rm_2_sb_mbx = new();


rd_gen rgen;
wr_gen wgen;

wr_drv wdrv;
rd_drv rdrv;

wr_mon wmon;
rd_mon rmon;

ref_model rm;
fifo_sb sb;

function new(virtual fifo_if.WR_DRV wr_drv_inf , virtual fifo_if.WR_MON wr_mon_inf , virtual fifo_if.RD_RDV rd_drv_inf ,virtual fifo_if.RD_MON rd_mon_inf );

this.wr_drv_inf = wr_drv_inf;
this.rd_drv_inf = rd_drv_inf;
this.wr_mon_inf = wr_mon_inf;
this.rd_mon_inf = rd_mon_inf;

endfunction


//build task

task build;

wgen = new(wr_gen_2_wr_drv_mbx);
rgen = new(rd_gen_2_rd_drv_mbx);

wdrv = new(wr_drv_inf,wr_gen_2_wr_drv_mbx);
rdrv = new(rd_drv_inf,rd_gen_2_rd_drv_mbx);

wmon = new(wr_mon_inf,wr_mon_2_sb_mbx,wr_mon_2_rm_mbx);
rmon = new(rd_mon_inf,rd_mon_2_sb_mbx,rd_mon_2_rm_mbx);

rm = new(wr_mon_2_rm_mbx,rd_mon_2_rm_mbx,rm_2_sb_mbx);
sb = new(wr_mon_2_rm_mbx,rd_mon_2_rm_mbx,rm_2_sb_mbx);

endtask



task reset_dut();
    
    fifo_if.wr_drv_cb.resetn <= wr_gen.wr_gen_pkt.resetn;

endtask



task start();
    wgen.run();
    rgen.run();
    wr_drv.run();
    rd_drv.run();
    wr_mon.run();
    rd_mon.run();
    ref_model.run();
    sb.run();
endtask



task stop;
    wait(sb.DONE.triggered);
endtask




task run();

    reset_dut();
    start();
    stop();
    sb.report();
    
endtask

endclass