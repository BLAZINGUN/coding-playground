`timescale 10ns/10ps

module decoder_2x4_gate_level (din,dout);

input en,a0,a1;

output d0,d1,d2,d3;
 
not n1 (an0,a0);
not n2 (an1,a1);

and a1 (d0,en,an0,an1);
and a2 (d1,en,a0,an1);
and a3 (d2,en,an0,a1);
and a4 (d3,en,a0,a1);

endmodule