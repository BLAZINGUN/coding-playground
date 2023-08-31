// with outside static variables
//in this outside static variables and inside variables will be updated but not the non static variables outside the function


//outside variables

// i is non static
// j is static


//inside variables

// x is non static
// y is static


module top;

    class base;
        int i;
        static int j;

        function static get1;
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

/*
i = 1 , j = 1, x = 1 , y = 1
i = 1 , j = 2, x = 2 , y = 2
i = 1 , j = 3, x = 3 , y = 3
i = 1 , j = 4, x = 4 , y = 4
i = 1 , j = 5, x = 5 , y = 5

*/