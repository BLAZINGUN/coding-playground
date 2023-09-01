
/*

1
23
456
78910

*/



module top;

int count = 1;

initial
        begin

                for(int i = 1 ; i < 5; i++)
                        begin
                                for(int j = 1; j < i+1; j++)
                                        begin
                                                $write("%0d",count);
                                                count++;
                                        end
                                $display("");
                        end
        end

endmodule


1
23
456
78910