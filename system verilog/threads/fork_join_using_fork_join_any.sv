
//fork join using fork join_any

module top;

initial 
  begin
    fork
        begin : b1
          #5 $display("at time : %0t",$time, " from block b1");
        end : b1

        begin : b2
          #10 $display("at time : %0t",$time, " from block b2");
        end : b2
    join_any

    wait fork;
    $display("at time : %0t",$time, " from outside fork-join block");
  end

endmodule