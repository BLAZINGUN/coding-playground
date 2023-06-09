`timescale 10ns/10ps
module mux_4x1_dataflow (a,b,c,d,s0,s1,y);  

input a,b,c,d,s0,s1;
output y;

reg y;

always @ (*) 

begin

if (s0==0 & s1==0)
	y<=a;

else if (s0==0 & s1==1)
	y<=b;

else if (s0==1 & s1==0)
	y<=c;

else if (s0==1 & s1==1)
	y<=d;


end



endmodule