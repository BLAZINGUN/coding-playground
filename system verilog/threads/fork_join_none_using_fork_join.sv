module top;
 
event e1,e2;

initial 
  begin
      fork
          begin : b1
            #5 $display($time, " from block b1");   
            -> e1;
          end : b1
 
          begin : b2
            #10 $display($time, " from block b2");
            -> e2;
          end : b2
      join
    
    wait(e1.triggered || e2.triggered);
    $display($time, " from outside fork-join block");
  end
 
endmodule

