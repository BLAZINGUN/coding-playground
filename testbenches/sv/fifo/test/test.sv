// Import fifo_pkg
import fifo_pkg::*;

// class fifo_trans_extnd1
class fifo_trans_extnd1 extends fifo_trans;


constraint VALID_DATA {data inside {[1:10000]};}
constraint valid_random_wr {write == 1; wr_address inside {[0:1170]};}
constraint valid_random_rd {rd_address inside {[0:1170]};}



endclass

// class fifo_trans_extnd2
class fifo_trans_extnd2 extends fifo_trans;


constraint VALID_DATA {data == 4294;}
constraint valid_random_wr {write == 1; wr_address inside {[4090:4095]};}
constraint valid_random_rd {rd_address inside {[4090:4095]};}



endclass
        //extend the fifo trans if required to cover all the bins

class test;


    //Instantiate virtual interface with Write BFM modport,Read BFM modport,
        //Write monitor modport,Read monitor modport
    virtual fifo_if.RD_BFM rd_if;
    virtual fifo_if.WR_BFM wr_if;
    virtual fifo_if.RD_MON rdmon_if;
    virtual fifo_if.WR_MON wrmon_if;

    // Declare a handle for fifo_env as env
    fifo_env env;

    // Declare a handle for extended fifo_trans
        fifo_trans_extnd1 data_h1;

        fifo_trans_extnd2 data_h2;


        // In constructor
        // Pass the BFM and monitor interface as the arguments
        // Create the object for env and pass the arguments
        // for the virtual interfaces in new() function
        function new( virtual fifo_if.WR_BFM wr_if,
                                virtual fifo_if.RD_BFM rd_if,
                                virtual fifo_if.WR_MON wrmon_if,
                                virtual fifo_if.RD_MON rdmon_if);
        this.wr_if = wr_if;
                this.rd_if = rd_if;
                this.wrmon_if = wrmon_if;
                this.rdmon_if = rdmon_if;
        env = new(wr_if,rd_if,wrmon_if,rdmon_if);
        endfunction



        // Task which builds the TB environment and runs the simulation
        // for different tests
        task build_and_run();
                begin
                        if($test$plusargs("TEST1"))
                                begin
                                        number_of_transactions = 500;
                                        env.build();
                                        env.run();
                                        $finish;
                                end
                        if($test$plusargs("TEST2"))
                           begin
                                   data_h1=new;
                                   number_of_transactions = 500;
                                   env.build();
                                   env.gen.gen_trans= data_h1;
                                   env.run();
                                   $finish;
                           end


                        if($test$plusargs("TEST3"))
                           begin
                                   data_h2=new;
                                   number_of_transactions = 200;
                                   env.build();
                                   env.gen.gen_trans= data_h2;
                                   env.run();
                                   $finish;
                           end


                end

        endtask

endclass


