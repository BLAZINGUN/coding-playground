
module top;

initial 
  begin
      fork
        begin : b1
          #5 $display("at time : ",$time, " from block b1");
        end : b1

        begin : b2
          #10 $display("at time : ",$time, " from block b2");
        end : b2

        begin : b3
        end : b3
    join_any

    $display("at time : ",$time, " from outside fork-join block");
  end

endmodule