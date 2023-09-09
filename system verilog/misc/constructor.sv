module top;


class base;

bit [3:0] x = 0;

        function new(int i );
                x = i;
        endfunction

        function void display();
                $display("\n x = %h",x);
        endfunction

endclass


class child extends base;

bit [3:0] x = 8;

function new();
        super.new(7);
endfunction

        function void display();
                $display("\n x = %h",x);
        endfunction

endclass



base b1;
child c1;

initial
        begin
                c1 = new();
                c1.display();
        end

endmodule
