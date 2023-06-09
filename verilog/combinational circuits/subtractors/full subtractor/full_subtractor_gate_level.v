`timescale 10ns/10ps

module full_subtractor_gate_level (a,b,c,d,bo); 

input a,b,c;
output d,bo;

wire w1,w4,w5,w6;
xor (d,a,b,c);
not n1(w1,a);
and a1(w4,w1,b);
and a2(w5,w1,c);
and a3(w6,b,c);
or o1(bo,w4,w5,w6);

endmodule