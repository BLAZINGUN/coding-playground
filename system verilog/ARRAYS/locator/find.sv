module top;

class example;
    rand bit[4:0] a[10];
    bit[4:0] q[$];
endclass

example e1;

initial
    begin
        e1 = new();
        assert(e1.randomize);
        $display("array  :%p",e1.a);

        //without using built-in
        foreach(e1.a[i])
                begin
                        if(e1.a[i] > 15)
                                e1.q.push_back(e1.a[i]);
                end

        $display("result :%p ",e1.q);
    end
endmodule


array  :'{3, 0, 3, 25, 28, 13, 16, 16, 13, 23}
result :'{25, 28, 16, 16, 23} 