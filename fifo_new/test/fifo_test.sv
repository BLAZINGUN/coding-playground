import fifo_pkg::*;



class wr_xtn1 extends wr_xtn;

//enabling the reset to clear dut (STATIC RESET)
constraint reset_eb {reset_n == 1'b0;} 

endclass


class wr_xtn2 extends wr_xtn;

//only write operation
constraint reset_and_write {    reset_n == 1'b1; 
                                wr_enb  == 1'b1;
                                wr_reg  == 1'b0;     } 
endclass


class wr_xtn3 extends wr_xtn;

//no write operation
constraint reset_and_write {    reset_n == 1'b1; 
                                wr_enb  == 1'b0;
                                wr_reg  == 1'b0;     } 
endclass



class rd_xtn1 extends rd_xtn;

//constraint for only read operation
constraint read {       resetn == 1;
                        rd_enb == 1;   }

endclass


//no read operation

class rd_xtn2 extends rd_xtn;

constraint no_read {    resetn == 1;
                        rd_enb == 0;    }

endclass




class fifo_test;

virtual fifo_if.WR_DRV wr_drv_if;
virtual fifo_if.WR_MON wr_mon_if;
virtual fifo_if.RD_DRV rd_drv_if;
virtual fifo_if.RD_MON rd_mon_if;


fifo_env env;

wr_xtn1 wr_xtn1_h;
wr_xtn2 wr_xtn2_h;
wr_xtn3 wr_xtn3_h;

rd_xtn1 rd_xtn1_h;
rd_xtn2 rd_xtn2_h;

function new(virtual fifo_if.WR_DRV wr_drv_if,virtual fifo_if.WR_MON wr_mon_if,virtual fifo_if.RD_DRV rd_drv_if,virtual fifo_if.RD_MON rd_mon_if);

this.wr_drv_if = wr_drv_if ;
this.wr_mon_if = wr_mon_if;
this.rd_drv_if = rd_drv_if;
this.rd_mon_if = rd_mon_if;

env = new(wr_drv_if,wr_mon_if,rd_drv_if,rd_mon_if);

endfunction

task build_and_run();

        if($test$plusargs("TEST1"))
            begin
                wr_xtn1_h = new(); //reset
                number_of_transactions = 2;
                env.build();
                env.wgen.wr_gen_pkt = wr_xtn1_h;
                env.run();
                $finish;
            end

        if($test$plusargs("TEST2"))
            begin
                wr_xtn2_h = new(); //write
                rd_xtn2_h = new(); //no read
                number_of_transactions = 5;
                env.build();
                env.wgen.wr_gen_pkt = wr_xtn1_h;
                env.run();
                $finish;
            end


        if($test$plusargs("TEST3"))
            begin
                wr_xtn1_h = new(); //reset
                number_of_transactions = 2;
                env.build();
                env.wgen.wr_gen_pkt = wr_xtn1_h;
                env.run();
                $finish;
            end

        if($test$plusargs("TEST4"))
            begin
                wr_xtn2_h = new(); //write (till full condition)
                rd_xtn2_h = new(); //no read
                number_of_transactions = 10;
                env.build();
                env.wgen.wr_gen_pkt = wr_xtn1_h;
                env.run();
                $finish;
            end


        if($test$plusargs("TEST5"))
            begin
                wr_xtn3_h = new(); //no write 
                rd_xtn1_h = new(); //read (till empty condition)
                number_of_transactions = 15;
                env.build();
                env.wgen.wr_gen_pkt = wr_xtn1_h;
                env.run();
                $finish;
            end
endtask





endclass



