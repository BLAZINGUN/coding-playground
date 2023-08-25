module top;

int q[$] = '{1,2,3};

function automatic void queue_insert (input int a,b , ref int  q[$]);
    //a = value to be inserted
    //b = location at which value to be inserted
    q[b] = a;

endfunction

initial
    begin
        $display("original queue : %p", q);
        queue_insert(4,2,q);
        $display("updated queue  : %p", q);
    end

endmodule
