module top;

class example;
    rand int unsigned a[10];
    constraint c1 {foreach(a[i])
                        a[i] inside {[0:30]};
            }
endclass

example e1;

int sum_t;

initial
    begin
        e1 = new();
        assert(e1.randomize);
        $display("array : %p",e1.a);
        sum_t = e1.a.sum();
        $display("sum_t = %d",sum_t);

        sum_t = e1.a.sum() with (item>20); 
        $display("sum_t = %d",sum_t);
    end

endmodule





module top;

class example;
    rand int unsigned a[10];
    constraint c1 {foreach(a[i])
                        a[i] inside {[0:30]};
            }
endclass

example e1;

int product_t;

initial
    begin
        e1 = new();
        assert(e1.randomize);
        $display("array : %p",e1.a);
        product_t = e1.a.product();
        $display("product_t = %d",product_t);

        //product_t = e1.a.product() with (item>20); 
        //$display("product_t = %d",product_t);
    end

endmodule





module top;

class example;
    rand int unsigned a[4];
    constraint c1 {foreach(a[i])
                        a[i] inside {[0:10]};}
endclass

example e1;

int and_t;

initial
    begin
        e1 = new();
        assert(e1.randomize);
        $display("array : %p",e1.a);
        and_t = e1.a.and();
        $display("and = %b",and_t);
    end

endmodule




module top;

class example;
    rand int unsigned a[4];
    constraint c1 {foreach(a[i])
                        a[i] inside {[0:10]};}
endclass

example e1;

int or_t;

initial
    begin
        e1 = new();
        assert(e1.randomize);
        $display("array : %p",e1.a);
        or_t = e1.a.or();
        $display("or = %b",or_t);
    end

endmodule

