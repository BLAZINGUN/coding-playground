module top;
class example;

int a[10] = {1,2,3,4,5,6,7,7,9,10};

int u_q[$];
int t_q[$];

endclass

example e1;

initial
    begin
        e1 = new();
        $display("original array : %p",e1.a);

        foreach(e1.a[i])
            begin
                e1.t_q = e1.a.find with (item == e1.a[i]);
                    if(e1.t_q.size == 1)
                        e1.u_q.push_back(e1.a[i]);
            end
        $display("unique array   : %p",e1.u_q);
    end

endmodule


original array : '{1, 2, 3, 4, 5, 6, 7, 7, 9, 10}
unique array   : '{1, 2, 3, 4, 5, 6, 9, 10}