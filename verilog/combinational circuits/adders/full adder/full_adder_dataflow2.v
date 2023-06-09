`timescale 10ns/10ps

module full_adder_dataflow2 (a,b,sum,carry); 

input a,b; 

output sum, carry; 

assign sum   = a ^ b ^cin ;
assign carry = (a&b) | (b&cin) | (cin&a); 

endmodule
