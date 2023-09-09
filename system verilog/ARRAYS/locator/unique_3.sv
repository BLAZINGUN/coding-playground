module top;

class example;
    rand bit[4:0] a[10];
    //for unique elements
    constraint c2 {unique{a};}
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


'{11, 10, 30, 24, 20, 0, 13, 27, 12, 1}
'{5, 12, 18, 15, 26, 7, 19, 6, 27, 20}
'{16, 22, 21, 11, 30, 1, 15, 14, 20, 27}
'{16, 20, 18, 1, 30, 7, 21, 27, 11, 24}
'{1, 0, 6, 18, 9, 3, 16, 17, 25, 31}