    module top;

    int q[$] = '{1,2,3};
    int i;


    typedef int q2[$] ;

    function q2 queue_delete (input int a , q2  q);

        //a =location at which value is to be deleted

        for(int i = 0; i<$size(q)-1; i++)
            begin
                if(i < a)
                    continue;
                else
                    q[i] = q[i+1];
            end

        i = q.pop_back();

        return q;
        //queue_insert = q; //both mean the same

    endfunction

    initial
        begin
            $display("original queue : %p", q);
            q = queue_delete(1,q);
            $display("updated queue : %p", q);
        end

    endmodule
