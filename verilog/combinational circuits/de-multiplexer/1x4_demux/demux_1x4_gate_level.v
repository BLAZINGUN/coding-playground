`timescale 10ns/10ps

module demux_1x4(d,s0,s1,y0,y1,y2,y3);

input d,s0,s1;
output y0,y1,y2,y3;

wire s0n,s1n;

not(s1n,s1),(s0n,s0);


and  a1(y0,d,s0n,s1n);
and  a2(y1,d,s0,s1n);
and  a3(y2,d,s0n,s1);
and  a4(y3,d,s0,s1);

endmodule