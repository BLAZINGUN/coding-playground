//events are static objects useful for synchronization between the process.
//they are to staged processes in which one process will trigger the event and another will wait for an event to be triggered
//events are triggered using -> or ->> operator
//waiting for an event can be done using @ or wait() construct

//these can be passed as arguments to tasks and can be assigned to one another or compared
//named events are triggered using the -> operator 
// non-blocking events are triggered using ->> operator
//@ operator cannot capture the event trigger in the same clock edge
//but wait construct will detect that event triggering

//wait_order() construct blocks the process until all of the specified events are triggered in the given order(left to right)
//if the events trigger in any order other than left to right will not unblock the process

//Ex: wait_order(a,b,c);
//if they trigger in out of order then error will occur

//we can give a statement as part of else condition , then error wont occur and fail message will be displayed
//Ex: wait_order(a,b,c) else $display("Error : events out of order");

//we can also capture the status of the result

/* bit success;
wait_order (a,b,c) success = 1;
else success = 0;
    */

//merging events : when one event variable is assigned to another , the two become merged.
//triggering one will trigger the other

//@ operator

module event_ex;


event e1;

initial
    begin
        
        fork
        
            begin
                #40;
                $display("triggering the event");
                ->e1;
            end


            begin
                $display("waiting for event to trigger");

                @(e1.triggered)
                $display($time,"event triggered");
            end
        join
    end


endmodule




//trigger first and then waiting for the trigger
//here triggering happens first and then the waiting for trigger happens.
//as waiting happens later , it will be blocking, so the statements after the wait for the trigger will not be executed.

module event_ex1;


event e2;


initial 
    begin
        
        fork
            begin    
                #40;
                $display($time,"triggering the event");
                ->e2;
            end

            begin
                $display($time,"waiting for event to trigger");
                #60;
                @(e2.triggered);
                $display($time,"event triggered");
            end
        join
    end


    initial
        begin
            #100;
            $display($time,"ending the simulation");
            $finish;
        end

endmodule