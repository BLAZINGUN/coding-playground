`timescale 10ns/10ps

module mod10counter (q,clk,reset);
  output reg [3:0]q;
  input clk,reset;



  always@(posedge clk)
    begin
      if(reset)
        q=4'b0000;
      else if(q==4'b1010)
        q=4'b0000;
      else
        q=q+1;
      end
  endmodule
