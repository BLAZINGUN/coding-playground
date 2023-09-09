module palindrome;

class example;

  

    rand int array;

  
    constraint c2 { 
        array%(10**8) == array%(10**1);
        array%(10**7) == array%(10**2);
        array%(10**6) == array%(10**3);
        array%(10**5) == array%(10**4);

    }


endclass

example e1;

initial 
    begin
        e1 = new();
        repeat(5)
            begin
                assert(e1.randomize());
                $display("The value of array is %b",e1.array);
            end
    end


endmodule