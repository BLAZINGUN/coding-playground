module vfe;

class a #(type T = int );

T i;

virtual function void disp();

        $display("the data type of i is %s", $typename(i));


endfunction


endclass


class b #(type P = real) extends a #(P);

function void disp();

        super.disp();
        $display("super method is executed");

endfunction

endclass


b b_h;
a#(real)  a_h;



initial
        begin
                b_h = new();
                a_h = b_h;
                a_h.disp();

        end

endmodule
