`timescale 10ns/10ps

//===============================================================================================================================


module full_adder (
    input a,
    input b,
    input cin,
    output reg sum,
    output reg carry
);
    
   // reg sum,carry;
    
    
     always @(a or b or cin)
      begin 
       sum = a ^ b ^ cin; 
       carry = (a&b) | ((a^b) & cin); 
      end
    
endmodule


//===============================================================================================================================


module ripple_carry_adder(a,b,cin,sum,carry);

input[3:0] a,b;
input cin;
output [3:0] sum;
output carry;

wire x1,x2,x3;

full_adder fa1(a[0],b[0],cin,sum[0],x1);
full_adder fa2(a[1],b[1],x1,sum[1],x2);
full_adder fa3(a[2],b[2],x2,sum[2],x3);
full_adder fa4(a[3],b[3],x3,sum[3],carry);

endmodule


//===============================================================================================================================



/* alternate way 

to use this un-comment the code and comment the top code.

use multi-line commenting for the above code.

instead of using cin, we can use 1'b0 since carry in(cin) is always 0.


module ripple_carry_adder(a,b,sum,carry);

input[3:0] a,b;

output [3:0] sum;

output carry;

full_adder fa1(a[0],b[0],1'b0,s[0],x1);
full_adder fa2(a[1],b[1],x1,s[1],x2);
full_adder fa3(a[2],b[2],x2,s[2],x3);
full_adder fa4(a[3],b[3],x3,s[3],carry);

endmodule


 */


//==============================================================================================================================