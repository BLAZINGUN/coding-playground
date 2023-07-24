import fifo_pkg::*;

class wr_xtn1 extends wr_xtn;

constraint reset_ {reset_n == 1'b0;} //enabling the reset

endclass



class wr_xtn2 extends wr_xtn;

constraint reset_ {reset_n == 1'b1;} //disabling the reset and write operation 
constraint write_op  {wr_enb == 1'b1;
                    wr_reg == 1'b0;
                    rd_enb == 1'b0;
                    } 
endclass


class wr_xtn3 extends wr_xtn;

constraint reset_ {reset_n == 1'b0;} //enabling the reset to check dynamic reset

endclass

//constraint for only read operation
class rd_xtn_1 extends rd_xtn;

constraint read {       resetn == 1;
                        rd_enb == 1;
                        rd_reg == 0;
                        wr_reg == 0;
                        wr_enb == 0;}

endclass




module assertion_(clock,resetn,wr_ptr,rd_ptr,wr_reg,wr_enb);

//assertion


sequence s1(a,b);

    wr_enb && !wr_reg;

endsequence


sequence s2(ptr);

    ptr == $past(ptr,1) + 1'b1;

endsequence

property p1;
    @(posedge clock);
    disable iff =(!resetn)
    s1 |=> s2
endproperty























class rd_xtn1 extends rd_xtn;


endclass

class fifo_test;

virtual fifo_if.WR_DRV wr_drv_if;
virtual fifo_if.WR_MON wr_mon_if;
virtual fifo_if.RD_DRV rd_drv_if;
virtual fifo_if.RD_MON rd_mon_if;


fifo_env env;
wr_xtn1 wr_xtn1_h;
rd_xtn1 rd_xtn1_h;

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
                number_of_transactions  = 200;
                env.build();
                env.run();
                $finish;
            end

        if($test$plusargs("TEST2"))
            begin
                wr_xtn1_h = new();
                number_of_transactions = 300;
                env.build();
                env.wgen.wr_gen_pkt = wr_xtn1_h;
                env.run();
                $finish;
            end

        if($test$plusargs("TEST3"))
            begin
                wr_xtn1_h = new();
                number_of_transactions = 250;
                env.build();
                env.wgen.wr_gen_pkt = wr_xtn1_h;
                env.run();
                $finish;
            end

endtask





endclass



