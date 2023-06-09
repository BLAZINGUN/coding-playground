`timescale 10 ns/10ps

module half_adder(a,b,sum,carry);

input a,b;
output sum , carry;

assign sum = a ^ b;
assign carry = a & b:

endmodule


module full_adder_using_half_adder(a,b,cin,sum,carry);

input a,b,cin;
output sum , carry;

wire x1,x2,x3;

half_adder ha1 (a,b,x1,x2);
half_adder ha1 (x1,cin,sum,x3);

or o1 (carry,x3,x2);

endmodule
