`timescale 10ns/10ps

module half_adder_behavioral (a,b,sum,carry); 

input a,b; 

output sum, carry; 

reg sum ,carry;


always @(a or b) 

 {carry,sum} = a + b; 

endmodule
