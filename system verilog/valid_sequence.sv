module top;

class example;

rand bit[3:0] da[];
bit valid = 1'b0;

constraint size_limit {da.size <15;
                        da.size > 8;}

constraint sorting { foreach(da[i])
                        da[i] inside {[1:100]} ;}

constraint condition {  foreach(da[i])
                                {       if(!valid)
                                                da[i]%3 != 0;

                                        else
                                                da[i]%3 != 1;   }
                                                                        }


constraint c1 { unique {da};}



function void post_randomize();

        da.sort;

endfunction



endclass


example e1;

initial
        begin
                e1 = new();

                assert(e1.randomize());
                $display("%p",e1.da);
        end



endmodule
