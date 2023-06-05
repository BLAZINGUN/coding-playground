`timescale 10ns/10ps

module mux_2x1_dataflow(i0,i1,s,y);



input i0, i1, s;

output y;

assign y=(s)?i1:i0;

endmodule