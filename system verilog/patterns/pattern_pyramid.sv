module top;

int n=5;

initial
    begin
        for(int i = 1 ; i < n+1; i++)
            begin
                for (int k = n ; k>i; k--)
                    begin
                        $write(" ");
                    end

                for(int j = 1; j < 2*i; j++)
                        begin
                                $write("*");
                        end
            
                for (int k = n ; k>i; k--)
                    begin
                        $write(" ");
                    end

                $display("");
            end
        end

endmodule


     *     
    ***    
   *****   
  *******  
 ********* 
***********


/*

####*####
###***###
##*****##
#*******#
*********


*/
