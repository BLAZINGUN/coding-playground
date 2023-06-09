`timescale 10ns/10ps

module demux_1x2_behavioral_using_if_else (din,s,y);

input din,s;
output [1:0]y;

reg y

always @ (*)

begin

if (s==0)
	begin
	y[0] = din;
	y[1]=0;
	end

if (s==1)
	begin
	y[1] = din;
	y[0] = 0;
	end


end

endmodule