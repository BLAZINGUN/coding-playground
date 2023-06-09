`timescale 10ns/10ps

module full_adder_dataflow1 (a,b,cin,sum,carry); 

input a,b,cin; 

output sum, carry; 

assign {carry,sum} = a + b + cin; 

endmodule
