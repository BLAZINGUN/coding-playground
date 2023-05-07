module top;

int a,b,c,d;
real r,s,t,u;



initial 

    begin
        
        a = 5 ;
        r = 6.5;

        b = r-a;
        s = r-a;

        //static catsing

        c = int'(b-s);
        t = real'(a-b);


        // casting using $cast

        $cast(d,a-c);
        $cast(u,c-r);

        $display("the value of b is %f" , b );
        $display("the value of s is %f" , s );
        $display("the value of c is %f" , c );
        $display("the value of t is %f" , t );

        $display("the value of d is %f" , d );
        $display("the value of u is %f" , u );



    end



endmodule

