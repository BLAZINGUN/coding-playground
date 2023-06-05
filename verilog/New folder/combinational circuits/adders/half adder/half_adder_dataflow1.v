`timescale 10ns/10ps

module half_adder_dataflow (a,b,sum,carry); 

input a,b; 

output sum, carry; 

assign {carry,sum} = a + b; 

endmodule
