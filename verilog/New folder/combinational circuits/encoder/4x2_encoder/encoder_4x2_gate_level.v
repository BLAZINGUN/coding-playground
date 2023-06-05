`timescale 10ns/10ps

module encoder_4x2_gate_level (d0,d1,d2,d3,a0,a1);

input d0,d1,d2,d3;
output a0,a1;

wire x,y,z;

not g1(x,d2);
and g2(y,x,d1);
or g3(a0,y,d3);
or g4(a1,d2,d3);

endmodule