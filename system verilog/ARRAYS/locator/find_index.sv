module top;

class example;
    rand bit[4:0] a[10];
    bit[4:0] q[$];
    int qi[$];
endclass

example e1;

initial
    begin
        e1 = new();
        assert(e1.randomize);
        $display("array  : \t%p",e1.a);

        //without using built-in methods
        foreach(e1.a[i])
            begin
                if(e1.a[i] > 15)
                    e1.qi.push_back(i);
            end

        $display("result : \t%p ",e1.qi);
    end

endmodule


array  : 	'{3, 0, 3, 25, 28, 13, 16, 16, 13, 23}
result : 	'{3, 4, 6, 7, 9}