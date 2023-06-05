`timescale 10ns/10ps

module LIFO_buffer_register_tb ;

 // Inputs

 reg [3:0] dataIn,RW,EN,Rst,Clk;

 // Outputs

 wire [3:0] dataOut;

 wire EMPTY,FULL;

 // Instantiate the Unit Under Test (UUT)

 LIFO_buffer_register uut (.dataIn(dataIn),.dataOut(dataOut),.RW(RW), .EN(EN), .Rst(Rst), .EMPTY(EMPTY), .FULL(FULL),.Clk(Clk));

 initial

 begin

  // Initialize Inputs

  dataIn  = 4'h0;

  RW  = 1'b0;

  EN  = 1'b0;

  Rst  = 1'b1;

  Clk  = 1'b0;

  // Wait 100 ns for global reset to finish

  #100;      

  // Add stimulus here

  EN   = 1'b1;

  Rst  = 1'b1;

  #40;

  Rst     = 1'b0;

  RW      = 1'b0;

  dataIn  = 4'h0;

  #20;

  dataIn = 4'h2;

  #20;

  dataIn = 4'h4;

  #20;

  dataIn = 4'h6;

  #20;

  RW  = 1'b1;

 end 

   always #10 Clk = ~Clk;

endmodule