
module top;

event e1,e2;

initial 

begin

    fork
      
      	begin : b3
          
        end : b3
        
        begin : b1
          #5 $display($time, " from block b1");
            ->e1;
        end : b1


        begin : b2
          #10 $display($time, " from block b2");
            ->e2;
        end : b2


        

    join_any



   $display($time, " from outside fork-join block");

end

endmodule