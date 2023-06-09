`timescale 10ns/10ps

module encoder_8x3_gate_level (d0,d1,d2,d3,d4,d5,d6,d7,a,b,c);

input d0,d1,d2,d3,d4,d5,d6,d7;
output a,b,c;

or(a,d4,d5,d6,d7);
or(b,d2,d3,d6,d7);
or(c,d1,d3,d5,d7);

endmodule
