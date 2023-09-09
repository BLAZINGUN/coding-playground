module top;

class fibonacci;;

rand bit[3:0] a[];

constraint c1 {a.size inside {[5:15]};}

function void post_randomize();
    a[0] = 0;
    a[1] = 1;

    for(int i=2; i<a.size;i++)
        a[i] = a[i-1] + a[i-2];
endfunction

endclass

fibonacci f;

initial
    begin
        f = new();
        repeat(5)
            begin
                assert(f.randomize);
                $display("%p",f.a);
            end
    end
endmodule

'{0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233}
'{0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89}
'{0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233}