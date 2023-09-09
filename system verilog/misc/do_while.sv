//do while

// this loop is a control flow statement that allows code to be executed repeatedly based on a given condition
//do-while is similar to while loop but in case of while loop execution of statements happens only if the condition is true.

//in a do-while, statements inside the loop will be executed at least once even if the condition is not satisfied.


module do_while();


int a ;

initial 

begin

    $display("---------------------------");

    do 
        begin
            $display("\t the value of a is %0d",a);
            a++;
        end
    
    while(a<5);
    $display("--------------------------------");

end


endmodule




//example 2

module do_while2;


int a ;

initial 
    begin


        $display("--------------------------");

        do 
            begin

                $display("\t value of a is %0d",a);
                a++;
            end
        
        while(a>5);

        $display("------------------------------");

    end

endmodule



