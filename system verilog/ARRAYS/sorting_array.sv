module top;

class example;

rand bit [4:0] a[];

constraint c1 {a.size == 10;}

constraint c2 {foreach(a[i])
                        { if(i>0)
                                a[i] > a[i-1];}

}

/*
function void post_randomize();

        int temp;

        for(int i = 0; i<9; i++)
                begin
                        for ( int j=i+1;j<10;j++)
                                begin
                                        if(a[j] < a[i])
                                                begin
                                                        temp = a[j];
                                                        a[j] = a[i];
                                                        a[i] = temp;

                                                end

                                end

                end



endfunction
*/

endclass


example e1;

initial
        begin
                e1 = new();
                assert(e1.randomize);
                $display("%p", e1.a );
        end



endmodule
