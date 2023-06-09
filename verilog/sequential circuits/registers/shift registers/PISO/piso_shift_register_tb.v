`timescale 10ns/10ps

module piso_shift_register_tb ;

reg clk;

reg clear;

reg pi;

wire so;

piso_shift_register uut (.clk(clk), .clear(clear),.pi(pi),.so(so));

initial begin

clk = 0;

clear = 0;

pi = 0;

#5 clear=1’b1;

#5 clear=1’b0;

#10 pi=1’b1;

#10 pi=1’b0;

#10 pi=1’b0;

#10 pi=1’b1;

#10 pi=1’b0;

#10 pi=1’bx;

end

always #5 clk = ~clk;

initial #150 $stop;

endmodule