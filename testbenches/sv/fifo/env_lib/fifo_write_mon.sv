
class fifo_write_mon;

        //Instantiate virtual interface instance wrmon_if of type fifo_if with WR_MON modport
        virtual fifo_if.WR_MON wrmon_if;

        //Declare a handle 'data2rm' of class type fifo_trans
        fifo_trans data2rm;

        //Declare a mailbox 'mon2rm' pafifoeterized by type fifo_trans
        mailbox #(fifo_trans) mon2rm;

        //In constructor
        //Pass the following properties as the input arguments

        //pass the virtual interface and the mailbox as arguments

        //make the connections and allocate memory for 'data2rm'

        function new(virtual fifo_if.WR_MON wrmon_if,
                                mailbox #(fifo_trans) mon2rm);
                this.wrmon_if=wrmon_if;
                this.mon2rm=mon2rm;
                this.data2rm=new;
        endfunction: new


        task monitor();
                @(wrmon_if.wr_mon_cb)
                wait(wrmon_if.wr_mon_cb.write==1)
        @(wrmon_if.wr_mon_cb);
                begin
                        data2rm.write= wrmon_if.wr_mon_cb.write;
                        data2rm.wr_address =  wrmon_if.wr_mon_cb.wr_address;
                        data2rm.data= wrmon_if.wr_mon_cb.data_in;
                        //call the display of the fifo_trans to display the monitor data
                        data2rm.display("DATA FROM WRITE MONITOR");

                end
        endtask


        //In start task

        task start();
        //within fork-join_none

        //In forever loop
                fork
                        forever
                                begin
        //Call the monitor task
        //Understand the provided monitor task
        //Monitor task samples the interface signals
        //according to the protocol and convert to transaction items
                                        monitor();
        //Put the transaction item into the mailbox mon2rm
                                        mon2rm.put(data2rm);
                                end
                join_none
        endtask: start

endclass:fifo_write_mon
