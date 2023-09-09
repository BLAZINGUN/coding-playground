module example;

class ex;

int count = 0;
rand bit [4:0] a[10];
constraint c1 {unique{a};}
function void post_randomize();


if(count %2 == 0)
        a.sort();
else
        a.rsort();

count++;
endfunction

endclass


ex g1;

initial
        begin
                g1 = new();
                repeat(10)
                begin
                assert(g1.randomize);
                $display("%p",g1.a);
        end     end

endmodule
