
class fifo_sb;
        //Declare an event DONE
        event DONE;

        //Declare 3 int datatypes for counting
        //number of read data received from the reference model(rm_data_count)
        //number of read data received from the monitor(mon_data_count)
        //number of read data verified(data_verified)
        int data_verified = 0;
        int rm_data_count = 0;
        int mon_data_count = 0;

        // Declare fifo_trans handles as 'rm_data','rcvd_data' and cov_data
        fifo_trans rm_data;

        fifo_trans rcvd_data;

        fifo_trans cov_data;
        //Declare 2 mailboxes as 'rm2sb','rdmon2sb' pafifoeterized by fifo_trans
        mailbox #(fifo_trans) rm2sb;     //ref model to sb
        mailbox #(fifo_trans) rdmon2sb;  //mon to sb

        //Write the functional coverage model
        //Define a covergroup as 'mem_coverage'
        //Define coverpoint and bins for read, data_out and rd_address
        //Define cross for read,rd_address
                covergroup mem_coverage;
        option.per_instance=1;


                RD_ADD : coverpoint cov_data.rd_address {
                        bins ZERO     = {0};
                        bins LOW1     = {[1:585]};
                        bins LOW2     = {[586:1170]};
                        bins MID_LOW  = {[1171:1755]};
                        bins MID      = {[1756:2340]};
                        bins MID_HIGH = {[2341:2925]};
                        bins HIGH1    = {[2926:3510]};
                        bins HIGH2    = {[3511:4094]};
                        bins MAX      = {4095};
                        }

                DATA : coverpoint cov_data.data_out {
                        bins ZERO = {0};
                        bins LOW1 = {[1:500]};
                        bins LOW2 = {[501:1000]};
                        bins MID_LOW = {[1001:1500]};
                        bins MID = {[1501:2000]};
                        bins MID_HIGH = {[2001:2500]};
                        bins HIGH1 = {[2501:3000]};
                        bins HIGH2 = {[3000:4293]};
                        bins MAX = {4294};
                        }



                RD      : coverpoint cov_data.read {
                        bins read  = {1};
                        }


                READxADD: cross RD,RD_ADD;


        endgroup : mem_coverage
         //In constructor
         //pass mailboxes as an argument
         //connect the mailboxes

         //create instance for the covergroup
        function new(mailbox #(fifo_trans) rm2sb,
                                mailbox #(fifo_trans) rdmon2sb);
                this.rm2sb = rm2sb;
                this.rdmon2sb = rdmon2sb;
                mem_coverage = new();
        endfunction: new

        //In start task
        //Within fork join_none  begin end
        task start();
                fork
                        while(1)
                                begin
        //Get the data from mailbox rm2sb

                                        rm2sb.get(rm_data);

        //Increment rm_data_count
                                        rm_data_count++;
        //Get the data from mailbox rdmon2sb
                                        rdmon2sb.get(rcvd_data);
        //Increment rcvd_data_count
                                        mon_data_count++;
        //Call check task and pass 'rcvd_data' handle as the input argument
                                        check(rcvd_data);

                                end
                join_none
        endtask: start

        virtual task check(fifo_trans rc_data);
                string diff;

                if(rc_data.read==1)
                        begin
                                if (rc_data.data_out == 0)
                                        $display("SB: Random data not written");
                                else if(rc_data.read==1 && rc_data.data_out!=0)
                                        begin
                                                if(!rm_data.compare(rc_data,diff))
                                                        begin:failed_compare
                                                                rc_data.display("SB: Received Data");
                                                                rm_data.display("SB: Data sent to DUV");
                                                                $display("%s\n%m\n\n", diff);
                                                                $finish;
                                                        end:failed_compare
                                                else
                                                        $display("SB:  %s\n%m\n\n", diff);
                                        end
        //assign rm_data to cov_data

        cov_data = rm_data;
        //Call the sample function on the covergroup
            mem_coverage.sample();


        //Increment data_verified
                data_verified++;
                if(data_verified >= (number_of_transactions-rc_data.no_of_write_trans))
                        begin
        //Trigger the event if the verified data count is equal to number of read and read-write transactions
                                ->DONE;
            end
                end
        endtask

        //In the report method
        //Display gen_data_count, rcvd_data_count, data_verified
        function void report();
                $display(" ------------------------ SCOREBOARD REPORT ----------------------- \n ");
                $display(" %0d Read Data Generated, %0d Read Data Recevied, %0d Read Data Verified \n",
                        rm_data_count,mon_data_count,data_verified);
                $display(" ------------------------------------------------------------------ \n ");
        endfunction: report


endclass:fifo_sb
~
