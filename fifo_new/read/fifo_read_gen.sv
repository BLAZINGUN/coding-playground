class rd_gen;

read_xtn read_gen_pkt;
read_xtn stim_2_dut;

mailbox #(read_xtn) read_gen_2_read_drv_mbx;


function new (mailbox #(read_xtn) read_gen_2_read_drv_mbx);

this.read_gen_2_read_drv_mbx = read_gen_2_read_drv_mbx;

endfunction



virtual task run();

        fork
                forever
                        begin
                                assert(read_gen_pkt.randomize());
                                stim_2_dut = new read_gen_pkt;
                                read_gen_2_read_drv_mbx.put(stim_2_dut);

                        end

        join_none



endtask

endfunction


endclass
