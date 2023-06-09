`timescale 10ns/10ps

module carry_look_ahead_adder(a,b,cin,sum,carry);

input [3:0] a,b;
input cin;
output [3:0] sum;
output carry ;


wire [3:0] p,g ;
wire [4:0] c ;

assign c[0] = cin;

genvar i;

for (i=0; i<=3; i=i+1)

	begin
		assign p[i] = a[i] ^ b[i];
		assign c[i+1] = ( a[i] & b[i] ) | ( a[i] & c[i] ) | ( b[i] & c[i] );
		assign sum[i] = a[i] ^ b[i] ^ c[i];
	end

assign carry = c[4] ;

endmodule

