`timescale 10ns/10ps


module encoder_8x3_behavioral_using_if_else (d0,d1,d2,d3,d4,d5,d6,d7,a0,a1,a2);

input d0,d1,d2,d3,d4,d5,d6,d7;

output a0,a1,a2;

reg a0,a1,a2;


always @ (*)

begin



if ({d7,d6,d5,d4,d3,d2,d1,d0}==0)
	begin

	a0 = 0;
	a1 = 0;
	a2 = 0;


	end

if ({d7,d6,d5,d4,d3,d2,d1,d0}==1)
	begin

	a0 = 1;
	a1 = 0;
	a2 = 0;


	end

if ({d7,d6,d5,d4,d3,d2,d1,d0}==2)
	begin

	a0 = 0;
	a1 = 1;
	a2 = 0;


	end

if ({d7,d6,d5,d4,d3,d2,d1,d0}==3)
	begin

	a0 = 1;
	a1 = 1;
	a2 = 0;


	end

if ({d7,d6,d5,d4,d3,d2,d1,d0}==4)
	begin

	a0 = 0;
	a1 = 0;
	a2 = 1;


	end

if ({d7,d6,d5,d4,d3,d2,d1,d0}==5)
	begin

	a0 = 1;
	a1 = 0;
	a2 = 1;


	end

if ({d7,d6,d5,d4,d3,d2,d1,d0}==6)
	begin

	a0 = 0;
	a1 = 1;
	a2 = 1;


	end

if ({d7,d6,d5,d4,d3,d2,d1,d0}==7)
	begin

	a0 = 1;
	a1 = 1;
	a2 = 1;


	end




end


endmodule