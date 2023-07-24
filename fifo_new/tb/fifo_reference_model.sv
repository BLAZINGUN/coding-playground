class ref_model;

//declare write and read monitor packets

wr_xtn wr_mon_2_rm_pkt;
rd_xtn rd_mon_2_rm_pkt;


//declare rd monitor to rm , wr monitor to rm , rm to sb mailboxes

mailbox #(wr_xtn) wr_mon_2_rm_mbx;
mailbox #(rd_xtn) rd_mon_2_rm_mbx;
mailbox #(rd_xtn) rm_2_sb_mbx;


//declare variables

bit resetn;
bit full;
bit empty;
bit underflow;
bit overflow;

bit wr_reg;
bit rd_reg;

bit wr_enb;
bit rd_enb;

bit full_temp;

bit [7:0] queue [$];
bit [7:0] limit;
bit [7:0] limit_temp = 8'd8;


//connect local mailboxes using new function

function new(mailbox #(wr_xtn wr_mon_2_rm_mbx , mailbox #(rd_xtn) rd_mon_2_rm_mbx , mailbox #(read_xtn) rm_2_sb_mbx);

this.rm_2_sb_mbx = rm_2_sb_mbx;
this.wr_mon_2_rm_mbx = wr_mon_2_rm_mbx;
this.rd_mon_2_rm_mbx = rd_mon_2_rm_mbx;

endfunction



virtual task write_fun();

`if_def NEED_REPORT
wr_mon_2_rm_pkt.print("REF MOD : WRITE MONITOR HAS SENT THE FOLLOWING PACKET");
`endif

if(wr_mon_2_rm_pkt.resetn ==0)
        begin

        resetn = 0;
        limit = 8;
        empty = 1;
        full = 0;
        undeflow = 0;
        overflow = 0;
        queue.delete();

        end

else
        begin
                resetn = 1;

                if(wr_mon_2_rm_pkt.wr_reg)
                        begin
                                limit = wr_mon_2_rm_pkt.datain;
                                wr_reg = wr_mon_2_rm_pkt.wr_reg;
                        end

                else if(!full && wr_mon_2_rm_pkt.wr_enb)
                        begin
                                queue.push_back(wr_mon_2_rm_pkt.datain);
                        end

                if (full && wr_mon_2_rm_pkt.wr_enb && !wr_mon_2_rm_pkt.wr_reg)
                        over_flow = 1;
                else
                        over_flow = 0

        end

endtask






virtual task read_fun();

`ifdef NEED_REPORT
rd_mon_2_rm_pkt.print("REF MOD : READ MONITOR HAS SENT THE FOLLOWING PACKET");
`endif

if(rd_mon_2_rm_pkt.rd_reg)
        begin
                rd_mon_2_rm_pkt.dataout = limit;
        end

else if (rd_mon_2_rm_pkt.rd_enb)
        begin
                if(empty)
                        begin
                                dataout = 0;
                                underflow = 1;
                        end
                else
                        begin
                                dataout = queue.pop_front();
                                underflow = 0;
                        end

        end

endtask


virtual task generate_outputs();

$display("the contents of the queue are %p and the size of the queue is %0d" , queue , queue.size());


if(queue.size == 0 )
        empty = 1;
else
        empty = 0;

if(queue.size == 16 )
        full = 1;
else
        full = 0;


rd_mon_2_rm_pkt.full = full;
rd_mon_2_rm_pkt.empty = empty;
rd_mon_2_rm_pkt.over_flow = overflow;
rd_mon_2_rm_pkt.underflow = underflow;


if(!resetn)
        rd_mon_2_rm_pkt.dataout = 0;
else if (rd_reg && wr_reg)
        rd_mon_2_rm_pkt.dataout = limit_temp;

limit  = limit_temp;
undeflow = 0;

if(queue.size >= limit)
        threshold = 1;
else
        threshold = 0;


`ifdef NEED_REPORT
        rd_mon_2_rm_pkt.print("DATA TO BE SENT TO SCOREBOARD");
endif


endtask





virtual task run();

fork
        forever
                begin
                        fork
                                begin
                                        wr_mon_2_rm_mbx.get(wr_mon_2_rm_pkt);
                                        write_fun();
                                end

                                begin
                                        rd_mon_2_rm_mbx.get(rd_mon_2_rm_pkt);
                                        read_fun();

                                end

                        join
                        generate_outputs();
                        rm_2_sb_mbx.put(rd_mon_2_rm_pkt);


                end

join_none

endtask





endclass
~
