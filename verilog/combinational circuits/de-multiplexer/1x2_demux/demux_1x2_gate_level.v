`timescale 10ns/10ps

module demux_1x2_gate_level (s,din,y0,y1):

input s, din;
output y0,y1;


not(sn,s);

and(y0,sn,din);

and(y1,s,din);

endmodule