`timescale 10ns/10ps

module full_adder_gate_level (a,b,cin,sum,carry); 

input a,b,cin; 

output sum, carry; 

wire p,q,r;
    
xor(p,a,b);
xor(sum,p,cin);


and(r,a,b);
and(q,p,cin);
or(cout,q,r);

endmodule