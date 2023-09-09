module top;

class example;
    rand bit[4:0] a[10];
    bit[4:0] q[$];
    bit[4:0] min_value;
endclass

example e1;

initial
    begin
        e1 = new();
        assert(e1.randomize);
        $display("array : %p",e1.a);

        //without using built-in method
        e1.min_value = e1.a[0];
        for (int i = 1; i<$size(e1.a)-1 ;i++)
            begin
                if(e1.a[i] < e1.min_value)
                    e1.min_value = e1.a[i];
            end

        $display("minimum value in the array is : %d ",e1.min_value);
    end

endmodule


array : '{3, 0, 3, 25, 28, 13, 16, 16, 13, 23}
minimum value in the array is :  0