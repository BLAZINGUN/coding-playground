
class fifo_env;

virtual fifo_if.WR_BFM wr_if;
virtual fifo_if.RD_BFM rd_if;
virtual fifo_if.WR_MON wrmon_if;
virtual fifo_if.RD_MON rdmon_if;

        //Instantiate virtual interface with Write BFM modport,
        //Read BFM modport,Write monitor modport,Read monitor modport


        //Declare 6 mailboxes pafifoeterized by fifo_trans and construct it


mailbox #(fifo_trans) gen2wr = new();
mailbox #(fifo_trans) gen2rd = new();

mailbox #(fifo_trans) wr2rm = new();
mailbox #(fifo_trans) rd2rm = new();

mailbox #(fifo_trans) rd2sb = new();
mailbox #(fifo_trans) rm2sb =  new();



        //Create handle for fifo_gen,fifo_read_bfm,fifo_write_bfm,fifo_read_mon,fifo_write_mon,fifo_model,fifo_sb


fifo_gen gen;
fifo_write_bfm wr_bfm;
fifo_read_bfm rd_bfm;
fifo_write_mon wr_mon;
fifo_read_mon rd_mon;
fifo_model model;
fifo_sb sb;



        //In constructor pass the BFM and monitor interface as the argument
        //and connect with the virtual interfaces of fifo _env

function new(virtual fifo_if.WR_BFM wr_if, virtual fifo_if.RD_BFM rd_if , virtual fifo_if.WR_MON wrmon_if , virtual fifo_if.RD_MON rdmon_if);

this.wr_if = wr_if;

this.rd_if = rd_if;

this.wrmon_if = wrmon_if;

this.rdmon_if = rdmon_if;



endfunction

        //In task build
        //create instances for generator,Read BFM,Write BFM,Write monitor
        //Read monitor,Reference model,Scoreboard

        //Understand and include the reset_dut task

task build ;

gen = new(gen2rd,gen2wr);
wr_bfm = new(wr_if,gen2wr);
rd_bfm = new(rd_if,gen2rd);
wr_mon = new(wrmon_if,wr2rm);
rd_mon = new(rdmon_if,rd2rm,rd2sb);
model = new (wr2rm,rd2rm,rm2sb);
sb = new(rm2sb,rd2sb);


endtask


        task reset_dut();
                begin
                        rd_if.rd_drv_cb.rd_address<='0;
                        rd_if.rd_drv_cb.read<='0;

                        wr_if.wr_drv_cb.wr_address<=0;
                        wr_if.wr_drv_cb.write<='0;

                        repeat(5) @(wr_if.wr_drv_cb);
                        for (int i=0; i<4096; i++)
                                begin
                                        wr_if.wr_drv_cb.write<='1;
                                        wr_if.wr_drv_cb.wr_address<=i;
                                        wr_if.wr_drv_cb.data_in<='0;
                                        @(wr_if.wr_drv_cb);
                                end
                        wr_if.wr_drv_cb.write<='0;
                        repeat (5) @(wr_if.wr_drv_cb);
                end
        endtask : reset_dut



task start;
gen.start();
wr_bfm.start();
rd_bfm.start();
wr_mon.start();
rd_mon.start();
model.start();
sb.start();


endtask

        //In start task
        //call all the start methods of generator,Read BFM,Write BFM,Read monitor
        //Write Monitor,reference model,scoreboard

        task stop();
                wait(sb.DONE.triggered);
        endtask : stop

        //In run task call resut_dut, start, stop methods & report function from scoreboard
task run();

reset_dut();
start();
stop();
sb.report();

endtask
endclass : fifo_env

