`timescale 10ns/10ps


module encoder_4x2_behavioral_using_if_else(d0,d1,d2,d3,a0,a1);

input d0,d1,d2,d3;

output a0,a1;

reg a0,a1;


always @ (*)

begin



if ({d3,d2,d1,d0}==0)
	begin

	a0 = 0;
	a1 = 0;


	end

if ({d3,d2,d1,d0}==1)
	begin

	a0 = 1;
	a1 = 0;
	

	end

if ({d3,d2,d1,d0}==2)
	begin

	a0 = 0;
	a1 = 1;
	

	end

if ({d3,d2,d1,d0}==3)
	begin

	a0 = 1;
	a1 = 1;
	

	end



end


endmodule