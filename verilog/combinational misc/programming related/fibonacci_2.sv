module top;

class Fibonacci;

rand bit [5:0] a[]; //dynamic array

constraint c1 {a.size inside {[2:11]};
                            foreach (a[j])
                                    if (j == 0)
                                        a[j] == 0;
                                    else if (j == 1)
                                        a[j] == 1;
                                    else 
                                    a[j] == a[j-1] + a[j-2]; }

endclass 

Fibonacci f;

initial 
    begin
        f = new();
        repeat (5) 
            begin 
            assert(f.randomize);
              $display("%p",f.a);
            end
    end
endmodule


'{0, 1, 1, 2}
'{0, 1, 1, 2}
'{0, 1, 1, 2, 3, 5, 8, 13}
'{0, 1}
'{0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55}