`timescale 10ns/10ps

module mux_4x1_tb;

reg a,b,c,d,s0,s1;
wire y;

mux_4x1_dataflow DUT (a,b,c,d,s0,s1,y);

initial 
	begin

	a=0;
	b=0;
	c=1;
	d=1;
	s0=1;
	s1=0;


	#10 a=1;
		b=1;
		c=0;
		d=1;
		s0=1;
		s1=0;

	#10 a=0;
		b=0;
		c=1;
		d=1;
		s0=1
		s1=0;
		#100 $finish
	end


always @ (*)

$monitor("AT TIME(in ns) = %t, a = %d ,b = %d, c = %d, d = %d, s0 =%d , s1 =%d y = %d ", $time , a , b , c , d , s0 , s1 , y );



endmodule


