module palindrome;

class example;
    rand bit[31:0] a;
    constraint c1 {foreach(a[i])
                a[i] == a[31-i];}
endclass

example e1;

initial 
    begin
        e1 = new();
        repeat(5)
            begin
                assert(e1.randomize());
                $display("The value of a is %b",e1.a);
            end
    end

endmodule


The value of a is 10100110101110000001110101100101
The value of a is 00101000101011000011010100010100
The value of a is 11111011101111011011110111011111
The value of a is 11101001101000011000010110010111
The value of a is 00000001101001000010010110000000