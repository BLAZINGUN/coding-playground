// Import ram_pkg
import ram_pkg::*;

// class ram_trans_extnd1
class ram_trans_extnd1 extends ram_trans;


constraint VALID_DATA {data inside {[1:10000]};}
constraint valid_random_wr {write == 1; wr_address inside {[0:1170]};}
constraint valid_random_rd {rd_address inside {[0:1170]};}



endclass

// class ram_trans_extnd2
class ram_trans_extnd2 extends ram_trans;


constraint VALID_DATA {data == 4294;}
constraint valid_random_wr {write == 1; wr_address inside {[4090:4095]};}
constraint valid_random_rd {rd_address inside {[4090:4095]};}



endclass
        //extend the ram trans if required to cover all the bins

class test;


    //Instantiate virtual interface with Write BFM modport,Read BFM modport,
        //Write monitor modport,Read monitor modport
    virtual ram_if.RD_BFM rd_if;
    virtual ram_if.WR_BFM wr_if;
    virtual ram_if.RD_MON rdmon_if;
    virtual ram_if.WR_MON wrmon_if;

    // Declare a handle for ram_env as env
    ram_env env;

    // Declare a handle for extended ram_trans
        ram_trans_extnd1 data_h1;

        ram_trans_extnd2 data_h2;


        // In constructor
        // Pass the BFM and monitor interface as the arguments
        // Create the object for env and pass the arguments
        // for the virtual interfaces in new() function
        function new( virtual ram_if.WR_BFM wr_if,
                                virtual ram_if.RD_BFM rd_if,
                                virtual ram_if.WR_MON wrmon_if,
                                virtual ram_if.RD_MON rdmon_if);
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


