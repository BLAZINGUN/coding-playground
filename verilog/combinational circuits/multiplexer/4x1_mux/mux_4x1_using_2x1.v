`timescale 10ns/10ps


mux_2x1(a,b,s,y);
input a,b,s;
output y;

assign y = (s) ? b : a ;

endmodule




module mux_4x1_using_2x1 (c,d,e,f,s0,s1,out);

input c,d,e,f,s0,s1;
output out ;

wire x1,x2;

mux_2x1 m1 (c,d,s0,x1);
mux_2x1 m2 (e,f,s0,x2);

mux_2x1 m3 (x1,x2,s1,out);



endmodule