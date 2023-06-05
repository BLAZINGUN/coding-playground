`timescale 10ns/10ps

module siso_shift_register_tb ;

reg clk;

reg clear;

reg si;

wire so;

sisomod uut (.clk(clk), .clear(clear),.si(si),.so(so));

initial begin

clk = 0;

clear = 0;

si = 0;

#5 clear=1’b1;

#5 clear=1’b0;

#10 si=1’b1;

#10 si=1’b0;

#10 si=1’b0;

#10 si=1’b1;

#10 si=1’b0;

#10 si=1’bx;

end

always #5 clk = ~clk;

initial #150 $stop;

endmodule