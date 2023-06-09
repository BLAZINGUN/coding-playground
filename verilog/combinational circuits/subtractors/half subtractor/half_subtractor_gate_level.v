`timescale 10ns/10ps

module half_subtractor_gate_level(a, b, d,bo);

input a, b;

output d, bo;

wire x;

xor u1(d,a,b);

not u3(x,a);

and u2(bo,x,b);



endmodule