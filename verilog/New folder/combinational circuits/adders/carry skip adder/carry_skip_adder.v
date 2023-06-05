`timescale 10 ns/10 ps

module carry_skip_adder(a,b,cin,sum,carry);                // also known as "carry by-pass adder"

input [3:0] a,b;
input cin;
output [3:0] sum;
output carry;

 wire [3:0]g,p;											// carry generate and propogate  
  wire [4:0]c;											// intermediate carry of adders
  wire z; 												// for the mux
  
  assign c[0] = cin;							    // this line is not needed can be directly written
  
  genvar i;

  for (i=0; i<=3; i=i+1)
  begin
    	assign p[i] = a[i] ^ b[i];
		assign c[i+1] = ( a[i] & b[i] ) | ( a[i] & c[i] ) | ( b[i] & c[i] );
		assign sum[i] = a[i] ^ b[i] ^ c[i];
  end
  

  //assign the mux value 

  
  assign z = p[0] & p[1] & p[2] & p[3];
  assign carry = z ? cin : c[4];

  endmodule