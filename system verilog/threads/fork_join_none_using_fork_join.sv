//fork join_none functionality using fork join

module top;

initial 
  begin
      fork
          begin : b1
            #5 $display($time, " from block b1");   
          end : b1

          begin : b2
            #10 $display($time, " from block b2");
          end : b2
      join

    $display($time, " from outside fork-join block");
  end

endmodule