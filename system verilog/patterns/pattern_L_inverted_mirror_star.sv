module top;

initial
        begin

                for(int i = 1 ; i < 5; i++)
                        begin
                                for (int k=0 ; k<i-1 ; k++)
                                        begin
                                                $write(" ");
                                        end


                                for(int j = 4; j > i-1; j--)
                                        begin
                                                $write("*");
                                        end
                                $display("");
                        end
        end

endmodule

****
 ***
  **
   *