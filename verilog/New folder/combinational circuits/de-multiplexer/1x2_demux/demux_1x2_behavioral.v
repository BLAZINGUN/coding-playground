`timescale 10ns/10ps

module demux_1x2_behavioral (s,din,y0,y1);

input s,d;
output y0,y1;

reg y0,y1,sn;

always @ (*)

begin

assign sn = ~ s;
assign y0 = sn & d;
assign y1 = s & d;

end

endmodule