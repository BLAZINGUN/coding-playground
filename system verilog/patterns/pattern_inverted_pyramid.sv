module top;

int n=5;

int m = 2*n;

initial
    begin
        for(int i = 1 ; i < n+1; i++)
            begin
                for (int k = 1 ; k<i; k--)
                    begin
                        $write(" ");
                    end

                for(int j = 1; j < m; j++)
                        begin
                                $write("*");
                        end
            
                for (int k = 1 ; k<i; k--)
                    begin
                        $write(" ");
                    end

                $display("");
                m=m-2;
            end
        end

endmodule

*********
 ******* 
  *****  
   ***   
    *    





/*

*********
#*******#
##*****##
###***###
####*####

*/
