module top;

class example;
    rand bit[4:0] a[10];
    bit[4:0] q[$];
    bit[4:0] max_value;
endclass

example e1;

initial
    begin
        e1 = new();
        assert(e1.randomize);
        $display("array : %p",e1.a);

        //without using built-in methods
        e1.max_value = e1.a[0];
        for (int i = 1; i<$size(e1.a)-1 ; i++)
            begin
                if(e1.a[i] > e1.max_value)
                    e1.max_value = e1.a[i];
            end

        $display("maximum value in the array is : %d ",e1.max_value);
    end

endmodule


array : '{3, 0, 3, 25, 28, 13, 16, 16, 13, 23}
maximum value in the array is : 28 