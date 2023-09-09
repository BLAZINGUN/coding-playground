module top;

class example;
    rand bit[4:0] a[10];

    constraint c1 {foreach(a[i])
                        {if(i>0)
                            a[i] > a[i-1];}}

    function void post_randomize();
        a.shuffle();
    endfunction

endclass

example e1;

initial
    begin
        repeat(5)
        begin
            e1 = new();
            assert(e1.randomize);
            $display("%p",e1.a);
        end
    end
endmodule



'{28, 22, 3, 20, 13, 29, 9, 4, 19, 21}
'{0, 4, 11, 29, 19, 12, 21, 9, 23, 24}
'{11, 8, 26, 30, 9, 24, 31, 23, 29, 7}
'{13, 17, 9, 31, 26, 10, 4, 27, 11, 16}
'{25, 3, 21, 26, 20, 31, 5, 18, 9, 16}


