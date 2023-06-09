`timescale 10ns/10ps

module mux_2x1_gate_level(i0,i1,s,y);


output y;
input i0, i1, s;
wire t1, t2, sbar;

and (t1, i1, s), (t2, i0, sbar);
not (sbar, s);
or (y, t1, t2);



endmodule