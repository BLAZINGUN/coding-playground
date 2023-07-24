class fifo_sb;

//declaring xtn handles
wr_xtn wr_mon_pkt;
rd_xtn rd_mon_2_sb_pkt;
rd_xtn rm_2_sb_pkt;


//declaring handles for coverage
wr_xtn wr_cov_data;
rd_xtn rd_cov_data;


//declaring mailboxes
mailbox #(wr_xtn) wr_mon_2_sb_mbx;
mailbox #(rd_xtn) rd_mon_2_sb_mbx;
mailbox #(rd_xtn) rm_2_sb_mbx;

//declaring string and event handles
string message;
event DONE;


//declaring variables to count the xtns
int total_no_of_comparisions;
int no_of_successfull_matches;
int no_of_failed_matches;



//covergroup for write xtn
covergroup wr_covergroup;

        option.per_instance = 1;
        option.auto_bin_max = 16;

        RESET : coverpoint wr_cov_data.resetn { bins ZERO = {0};
                                                bins ONE  = {1}; }

        WR_ENB : coverpoint wr_cov_data.wr_enb { bins ZERO = {0};
                                                      ONE  = {1}; }



        WR_REG : coverpoint wr_cov_data.wr_reg { bins ZERO = {0};
                                                      ONE  = {1};


        DYNAMIC_RESET : coverpoint wr_cov_data.resetn { option.at_least = 3;
                                                        bins ZEROTOONE = (0=>1);
                                                        bins ONETOZERO = (1=>0); }

        DATA_IN : coverpoint wr_cov_data.datain;

        RESETXWR_ENB : coverpoint (!wr_cov_data.resetn) && wr_cov_data.wr_enb;

        RESETXWR_REG : coverpoint (!wr_cov_data.resetn) && wr_cov_data.wr_reg;
        WR_REGXWR_ENB : coverpoint wr_cov_data.wr_reg && wr_cov_data.wr_enb;
        RESETXWR_REGXWR_ENB : coverpoint (!wr_cov_data.resetn) && wr_cov_data.wr_enb && wr_cov_data.wr_reg;


endgroup

//covergroup for read xtn
covergroup rd_covergroup;
        option.per_instance = 1;
        option.auto_bin_message = 16;


        RD_ENB : coverpoint rd_cov_data.rd_enb { bins ZERO = {0};
                                                bins ONE  = {1}; }


        RD_REG : coverpoint rd_cov_data.rd_reg { bins ZERO = {0};
                                                bins ONE  = {1}; }
        DATA_OUT : coverpoint rd_cov_data.dataout { bins ZERO = {0};
                                                bins ONE  = {1}; }
        FULL : coverpoint rd_cov_data.full { bins ZERO = {0};
                                                bins ONE  = {1}; }
        EMPTY : coverpoint rd_cov_data.empty { bins ZERO = {0};
                                                bins ONE  = {1}; }
        THRESHOLD : coverpoint rd_cov_data.threshold { bins ZERO = {0};
                                                bins ONE  = {1}; }
        OVERFLOW : coverpoint rd_cov_data.over_flow { bins ZERO = {0};
                                                bins ONE  = {1}; }
        UNDERFLOW : coverpoint rd_cov_data.undeflow { bins ZERO = {0};
                                                bins ONE  = {1}; }

        THRESHOLDTRANS : coverpoint rd_cov_data.threshold { bins ZEROTOONE = (0=>1);
                                                bins ONETOZERO  = (1=>0); }
        OVERFLOWTRANS : coverpoint rd_cov_data.over_flow { bins ZEROTOONE = (0=>1);
                                                bins ONETOZERO  = (1=>0); }
        UNDERFLOWTRANS : coverpoint rd_cov_data.undeflow { bins ZEROTOONE = (0=>1);
                                                bins ONETOZERO  = (1=>0); }
        FULLTRANS : coverpoint rd_cov_data.full { bins ZEROTOONE = (0=>1);
                                                  bins ONETOZERO = (1=>0); }

        EMPTYTRANS : coverpoint rd_cov_data.empty { bins ZEROTOONE = (0=>1);
                                                bins ONETOZERO  = (1=>0); }

        RD_ENBXRD_REG : coverpoint rd_cov_data.rd_enb && rd_cov_data.rd_reg;

endgroup


//new function to connect local properties
function new(mailbox #(wr_xtn) wr_mon_2_sb_mbx , mailbox #(rd_xtn) rd_mon_2_sb_mbx , mailbox #(rd_xtn) rm_2_sb_mbx);

this.wr_mon_2_sb_mbx = wr_mon_2_sb_mbx;
this.rd_mon_2_sb_mbx = rd_mon_2_sb_mbx;
this.rm_2_sb_mbx = rm_2_sb_mbx;
wr_covergroup = new();
rd_covergroup = new();

endfunction



virtual task run();

        fork
                forever
                        begin
                                fork

                                        begin
                                                wr_mon_2_sb_mbx.get(wr_mon_pkt);
                                                `ifdef SB_PKTS
                                                        wr_mon_pkt.print(" SB : WRITE MONITOR HAS SENT THE BELOW PACKET");
                                                `endif
                                                wr_cov_data = wr_mon_pkt;
                                                wr_covergroup.sample();
                                        end



                                        begin
                                                rd_mon_2_sb_mbx.get(rd_mon_2_sb_pkt);
                                                `ifdef SB_PKTS
                                                        rd_mon_2_sb_mbx_pkt.print("SB : READ MONITOR HAS SENT THE FOLLOWING PACKET");
                                                `endif
                                                rd_cov_data = rd_mon_2_sb_pkt;
                                                rd_covergroup.sample();
                                        end




                                        begin
                                                rm_2_sb_mbx.get(rm_2_sb_pkt);
                                                `ifdef SB_PKTS
                                                        rm_2_sb_pkt.print("SB : SCORE BOARD HAS SENT THE FOLLOWING PACKETS");
                                                endif

                                        end
                                join

                                total_no_of_comparisions++;
                                if(rd_mon_2_sb_pkt.compare(rm_2_sb_pkt,message)
                                        no_of_successfull_matches++;
                                else
                                        no_of_failed_matches++;

                                $display("transaction number = %d \n %s", total_no_of_comparisions , message);
                                if(wr_mon_pkt.total_no_of_xtns == total_no_of_comparisions)
                                -> DONE;



                        end


        join_none


endtask




function void report();

$display("*****************************************");
$display("total no of comparisions  = %0d" , total_no_of_comparisions);
$display("total no of successfull matches  = %0d" , no_of_successfull_matches);
$display("total no of comparisions  = %0d" , no_of_failed_matches );
$display("*****************************************");

if(no_of_successfull_matches == total_no_of_comparisions)
        begin

                $display("*****************************************");
                $display("\tFIFO PASSED ALL CONDITIONS\t");
                $display("*****************************************");
        end
endfunction


endclass
~
