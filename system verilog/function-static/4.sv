
// with outside static variables
//in this outside static variables and inside variables will be updated but not the non static variables outside the function


//outside variables

// i is non static
// j is static


//inside variables

// x is non static
// y is static

// static function static
//cant use non static variables inside static function
// so commenting non static variables
module top;

    class base;
        int i;
        static int j;

        static function static get1;
            int x;
            static int  y;

            x++;
            i++;
            j++;
            y++;

            $display("i = %0d , j = %0d, x = %0d , y = %0d",i,j,x,y);
        endfunction

    endclass

    base b_h;

    initial
        begin
            for(int k  = 0; k<5 ; k++)
                begin
                    b_h = new();
                    b_h.get1;
                end
        end

endmodule
