module top;

int q3[$] = '{1,2,3};

function automatic void queue_insert (input int a,b , ref int  q3[$]);
    //a = value to be inserted
    //b = location at which value to be inserted

    q3[b] = a;
endfunction

initial
    begin
      $display("original queue : %p", q3);
        queue_insert(4,2,q3);
      $display("updated queue  : %p", q3);
    end

endmodule
