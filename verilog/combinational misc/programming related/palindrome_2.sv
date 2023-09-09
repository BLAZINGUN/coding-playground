module palindrome;

class example;
    rand bit[31:0] a;
    function void post_randomize;
        for(int i=0; i<16; i++)
            begin
                a[31-i] = a[i];
            end    
    endfunction
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


The value of a is 00011001011001111110011010011000
The value of a is 01000000100100100100100100000010
The value of a is 11000100110110111101101100100011
The value of a is 01000101010001011010001010100010
The value of a is 11000001111011111111011110000011