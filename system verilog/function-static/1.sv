
// with outside static variables
//in this outside static variables and inside variables will be updated but not the non static variables outside the function


//outside variables

// i is non static
// j is static


//inside variables

// x is non static
// y is static

//no static at all

module top;

    class base;
        int i;
        static int j;

        function  get1;
            int x;
            static int  y;

            x++;
            i++;
            j++;
            y++;

            $display("i = %d , j = %d, x = %d , y = %d",i,j,x,y);
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



i = 1 , j = 1, x = 1 , y = 1
i = 1 , j = 2, x = 1 , y = 2
i = 1 , j = 3, x = 1 , y = 3
i = 1 , j = 4, x = 1 , y = 4
i = 1 , j = 5, x = 1 , y = 5