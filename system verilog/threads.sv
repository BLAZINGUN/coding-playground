/*

processes 

1. fork-join
2. fork-join_any
3. fork-join_none

process control

wait-fork
disable-fork


*/


//fork-join

//it will start all the processes inside parallely and wait for all the processes to complete


module fork_join;

initial 
    begin

        fork
            

            begin
                $display($time,"\tprocess 1 started");
                #5;
                $display($time, "\tprocess 1 finished");
            end


            begin
                $display("process 2 started");
                #20
                $display("process 2 ended");
            end
        join

        $display("\toutside fork-join");

        $finish;
    end

endmodule


//fork-join_any
//this will block the code after it until any one of the process completes

module fork_join_any;

initial 
    begin

        fork
            

            begin
                $display($time,"\tprocess 1 started");
                #5;
                $display($time, "\tprocess 1 finished");
            end


            begin
                $display("process 2 started");
                #20
                $display("process 2 ended");
            end
        join_any

        $display("\toutside fork-join");

        $finish;
    end

endmodule



//fork-join_none

// this doesnt block any following code and all execute at the same time

module fork_join_none;

initial 
    begin

        fork
            

            begin
                $display($time,"\tprocess 1 started");
                #5;
                $display($time, "\tprocess 1 finished");
            end


            begin
                $display("process 2 started");
                #20
                $display("process 2 ended");
            end
        join_none

        $display("\toutside fork-join");

        $finish;
    end

endmodule





//wait-fork

//this causes the process to block until the completion of all processes started from fork blocks

module wait_fork;

  initial 
    begin
        $display("-----------------------------------------------------------------");
        
        fork
             //Process-1
            begin
                $display($time,"\tProcess-1 Started");
                #5;
                $display($time,"\tProcess-1 Finished");
            end

            //Process-2
            begin
                $display($time,"\tProcess-2 Started");
                #20;
                $display($time,"\tProcess-2 Finished");
            end
        join_any

        wait fork; //waiting for the completion of active fork threads     
        $display("-----------------------------------------------------------------");
        $finish; //ends the simulation
    end
endmodule




//disable fork

//causes the process to kill/terminate all the active processes started from fork blocks

module disable_fork;

  initial begin
    $display("-----------------------------------------------------------------");

    //fork-1
    fork
      //Process-1
      begin
        $display($time,"\tProcess-1 of fork-1 Started");
        #5;
        $display($time,"\tProcess-1 of fork-1 Finished");
      end
      
      //Process-2
      begin
        $display($time,"\tProcess-2 of fork-1 Started");
        #20;
        $display($time,"\tProcess-2 of fork-1 Finished");
      end
    join_any

    //fork-2
    fork
      //Process-1
      begin
        $display($time,"\tProcess-1 of fork-2 Started");
        #5;
        $display($time,"\tProcess-1 of fork-2 Finished");
      end
      //Process-2
      begin
        $display($time,"\tProcess-2 of fork-2 Started");
        #20;
        $display($time,"\tProcess-2 of fork-2 Finished");
      end
    join_none    

    disable fork;
    
    $display("-----------------------------------------------------------------");
      $display($time,"\tAfter disable-fork");
    $display("-----------------------------------------------------------------");
  end
endmodule