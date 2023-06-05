`timescale 10ns/10ps

module demux_1x2_dataflow (s,din,y0,y1);

input s,d;
output y0,y1;



assign sn = ~ s;
assign y0 = sn & d;
assign y1 = s & d;

endmodule