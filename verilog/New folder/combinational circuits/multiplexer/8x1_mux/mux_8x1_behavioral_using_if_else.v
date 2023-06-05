`timescale 10ns/10ps

module mux_8x1_behavioral_using_if_else (a,b,c,d,e,f,g,h,s0,s1,s2,y);  

input a,b,c,d,e,f,g,h,s0,s1,s2;
output y; 

reg y;


always @ (*) 

begin

if (s0==0 & s1==0 s2==0)
	y<=a;

else if (s0==0 & s1==0 s2==1)
	y<=b;

else if (s0==0 & s1==1 s2==0)
	y<=c;

else if (s0==0 & s1==1 s2==1)
	y<=d;

else if (s0==1 & s1==0 s2==0)
	y<=e;

else if (s0==1 & s1==0 s2==1)
	y<=f;

else if (s0==1 & s1==1 s2==0)
	y<=g;

else if (s0==1 & s1==1 s2==1)
	y<=h;


end



endmodule
