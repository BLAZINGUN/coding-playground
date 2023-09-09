module top;



task double(int a = 10 , string s = "hello");

    #5;
    a = a*2;
    $display( $time , "s = %s , a = %d " , s , a);

endtask 


initial

    fork
       


        begin
                double(5," from thread 1 : ");
        end


        begin
                #2;
                double(4," from thread 2 : ");

        end

//to run task with default values
        begin
                double;
        end

    join


endmodule