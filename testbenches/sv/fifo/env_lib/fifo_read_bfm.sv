
class fifo_read_bfm;
        // Instantiate virtual interface instance rd_if of type fifo_if with RD_BFM modport

        virtual fifo_if.RD_BFM rd_if;

        // Declare a handle for fifo_trans as 'data2duv'

        fifo_trans data2duv;

        // Declare a mailboxes 'gen2rd' pafifoeterized by fifo_trans
        mailbox #(fifo_trans) gen2rd;

        // In constructor
        // Pass the following as the input arguments
        // virtual interface
        // mailbox handle 'gen2rd' pafifoeterized by fifo_trans
        // Make connections
        // For example this.gen2rd=gen2rd
        function new(virtual fifo_if.RD_BFM rd_if,
                                mailbox #(fifo_trans) gen2rd);
                this.rd_if=rd_if;
                this.gen2rd=gen2rd;
        endfunction: new

        virtual task drive();
                @(rd_if.rd_drv_cb);
                rd_if.rd_drv_cb.rd_address<=data2duv.rd_address;
                rd_if.rd_drv_cb.read<=data2duv.read;

        // Wait for two clock cycles after applying all the inputs
    // if read is high, atleast one clock cycle will be required to read the data
                repeat(2)
                        @(rd_if.rd_drv_cb);

        // Disable the read signal
                rd_if.rd_drv_cb.read<='0;

        endtask : drive
        // In virtual task start

        virtual task start();
                // Within fork join_none
                fork
                        forever
                                begin
                // Within forever , inside begin end
                // get the data from mailbox 'gen2rd'
                // call drive task
                                        gen2rd.get(data2duv);
                                        drive();
                                end
                join_none
        endtask: start

endclass: fifo_read_bfm
