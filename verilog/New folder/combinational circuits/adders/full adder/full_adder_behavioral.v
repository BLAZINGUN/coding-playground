`timescale 10ns/10ps

module full_adder_behavioral (
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
       carry = (a&b) | (b&cin) | (cin&a); 
      end
    
endmodule
