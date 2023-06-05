module test;

reg a,b,c,d;

wire e;

and a1 (e,a,b,c,d);

initial
    begin

        $monitor("%t d= %b , e = %b" , $time,d,e);

        assign d = a & b& c;
        a = 1;
        b = 0;
        c = 1;

        #10
        force d = (a|b|c);
        force e = (a|b|c);

        #10
        release d;
        release e;

        #10 $finish;

        
    end

endmodule
