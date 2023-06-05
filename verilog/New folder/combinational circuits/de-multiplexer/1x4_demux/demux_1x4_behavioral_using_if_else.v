`timescale 10ns/10ps

module demux_1x4_behavioral_using_if_else (din,s0,s1,y0,y1,y2,y3);

input din,s0,s1;
output y0,y1,y2,y3;

reg y0,y1,y2,y3;

always @ (*)

begin

if (s0==0 && s1==0)
	begin
	y[0] = din;
	y[1] = 0;
	y[2] = 0;
	y[3] = 0;

	end

if (s0==0 && s1==1)
	begin
	y[0] = 0;
	y[1] = din;
	y[2] = 0;
	y[3] = 0;

	end

if (s0==1 && s1==0)
	begin
	y[0] = 0;
	y[1] = 0;
	y[2] = din;
	y[3] = 0;

	end

if (s0==1 && s1==1)
	begin
	y[0] = 0;
	y[1] = 0;
	y[2] = 0;
	y[3] = din;

	end

end

endmodule