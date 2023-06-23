//multiple initializations in for loop


module for_loop;

    initial begin
        
        for (int j=0,i=4; j<8;j++)
            begin
                if(j==i)
                    $display("value of j equals to the value of i. j = %0d,i = %0d",j,i)
            end


    end

endmodule



multiple modifiers in for loop
    
    module for_loop;

        initial
            begin
                
                for (int j=0,i=7; j<8; j++,i--)
                    $display("\t value j = %0d",j,i);


            end
    endmodule