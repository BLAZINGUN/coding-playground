
module top;

class example;
    rand bit[4:0] a[10];
    int q[$];
endclass

example e1;

initial
    begin
        e1 = new();
        assert(e1.randomize);
        $display("array  : \t%p",e1.a);

        //without using built-in methods
        for(int i = $size(e1.a) -1; i >= 0; i--)
            begin
                if(e1.q.size == 1)
                    break;

                else if(e1.a[i] > 15)
                    e1.q.push_back(i);
            end
        $display("result : \t%p ",e1.q);
    end

endmodule

array  : '{3, 0, 3, 25, 28, 13, 16, 16, 13, 23}
result : '{9}