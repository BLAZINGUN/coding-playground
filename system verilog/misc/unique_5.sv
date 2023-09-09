//using ascending order constraint and shuffling it
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

