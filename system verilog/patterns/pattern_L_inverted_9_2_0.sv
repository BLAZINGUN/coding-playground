module top;

int count = 9;

initial
        begin

                for(int i = 1 ; i < 5; i++)
                        begin
                                for(int j = 4; j > i-1; j--)
                                        begin
                                                $write("%0d",count);
                                                count--;
                                        end
                                $display("");
                        end
        end

endmodule



9876
543
21
0