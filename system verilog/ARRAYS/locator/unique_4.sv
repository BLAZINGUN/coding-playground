module top;

class example;
    rand bit[4:0] a[10];
    //for unique elements
    constraint c2 {foreach(a[i])
                        {foreach(a[j])
                            {if(i != j)
                                    a[i] != a[j];}}}
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


'{31, 2, 4, 12, 15, 30, 11, 8, 28, 29}
'{8, 29, 23, 4, 11, 27, 6, 16, 22, 25}
'{7, 21, 29, 15, 13, 12, 16, 25, 14, 27}
'{20, 8, 4, 31, 18, 2, 16, 25, 12, 9}
'{29, 2, 23, 18, 22, 15, 27, 0, 6, 19}