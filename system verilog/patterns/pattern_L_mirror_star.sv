module top;

int n = 5;

initial
        begin

                for(int i = 1 ; i < n; i++)
                        begin

                                for(int k = n-2; k >= i; k--)
                                        begin
                                                $write(" ");
                                        end


                                for(int j = 1; j < i+1; j++)
                                        begin
                                                $write("*");
                                        end
                                $display("");
                        end
        end

endmodule

   *
  **
 ***
****