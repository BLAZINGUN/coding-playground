`timescale 10ns/10ps

module FIFO_buffer_register_tb;

 // Inputs

 reg [31:0] dataIn;

 reg Clk,RD,WR,EN,Rst;

 // Outputs

 wire [31:0] dataOut;

 wire EMPTY,FULL;

 // Instantiate the Unit Under Test (UUT)

 FIFObuffer uut (.Clk(Clk), .dataIn(dataIn), .RD(RD), .WR(WR), .EN(EN), .dataOut(dataOut), .Rst(Rst), .EMPTY(EMPTY), .FULL(FULL));


 initial 

 begin

  // Initialize Inputs

  Clk  = 1'b0;

  dataIn  = 32'h0;

  RD  = 1'b0;

  WR  = 1'b0;

  EN  = 1'b0;

  Rst  = 1'b1;

  // Wait 100 ns for global reset to finish

  #100;        

  // Add stimulus here

  EN  = 1'b1;

  Rst  = 1'b1;

  #20;

  Rst  = 1'b0;

  WR  = 1'b1;

  dataIn  = 32'h0;

  #20;

  dataIn  = 32'h1;

  #20;

  dataIn  = 32'h2;

  #20;

  dataIn  = 32'h3;

  #20;

  dataIn  = 32'h4;

  #20;

  WR = 1'b0;

  RD = 1'b1;  

 end 

 always #10 Clk = ~Clk;    

endmodule
