module top;

class example;
    int a[10] = {1,2,3,4,5,6,7,7,9,10};
    int u_q[$];
    int i_q[$];
    int count;
endclass

example e1;

initial
    begin
        e1 = new();
        $display("original array : %p",e1.a);

        for(int i=0; i<10; i++)
            begin
                for(int j=0; j<i;j++)
                    begin
                        e1.count = 0;
                        if(i!=j)
                            begin
                                if(e1.a[i] == e1.a[j])
                                    e1.count++;
                            end
                    end
                if(e1.count == 0)
                    begin
                        e1.u_q.push_back(e1.a[i]);
                        e1.i_q.push_back(i);
                    end
            end
        $display("unique array   : %p",e1.u_q);
        $display("unique_indexes : %p",e1.i_q);
    end

endmodule



original array : '{1, 2, 3, 4, 5, 6, 7, 7, 9, 10}
unique array   : '{1, 2, 3, 4, 5, 6, 7, 9, 10}
unique_indexes : '{0, 1, 2, 3, 4, 5, 6, 8, 9}