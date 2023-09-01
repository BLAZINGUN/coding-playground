
/*

1
12
123
1234



*/



module top;


initial
        begin

                for(int i = 1 ; i < 5; i++)
                        begin
                                for(int j = 1; j < i+1; j++)
                                        begin
                                                $write("%0d",j);
                                        end
                                $display("");
                        end
        end

endmodule

1
12
123
1234