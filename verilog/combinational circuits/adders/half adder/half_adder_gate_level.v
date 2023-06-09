`timescale 10ns/10ps

module half_adder_gate_level (a,b,sum,carry); 

input a,b; 

output sum, carry; 



xor x1 (sum,a,b);
and a1 (carry,a,b);

endmodule
