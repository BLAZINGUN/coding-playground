/*
iff in event control example

In the below example,
block-1 will be executed at the posedge of clk if reset is equals to ‘0’.
block-2 will be executed at every posedge and negedge of the clk signal.

*/


module event_ctrl;
  bit clk;
  bit reset;
  always #2 clk = ~clk;

  //at posedge of clk if reset is equals to '0',always block will be executed
  always @(posedge clk iff reset == 0)
  begin :block-1
    $display($time,"\tInside always block");
  end :block-1

  //always block will be executed at every posedge and negedge of clk signal
  always @(posedge reset or negedge reset)
  begin :block-2
    $display($time,"\tReset Value = %0d",reset);
  end :block-2

  initial begin
   #40 $finish;
  end
  initial begin
    reset = 1;
    #7 reset = 0;
    #8 reset = 1;
    #5 reset = 0;
  end
endmodule