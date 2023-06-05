`timescale 10ns/10ps

module mux_4x1_gate_level(a, b, c, d, s0, s1,y);

input a, b, c, d, s0, s1;
output y;

wire s0bar, s1bar, T1, T2, T3, T4;

not (s0bar, s0), (s1bar, s1);
and (T1, a, s0bar, s1bar), (T2, b, s0bar, s1),(T3, c, s0, s1bar), (T4, d, s0, s1);
or(y, T1, T2, T3, T4);

endmodule