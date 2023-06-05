`define SIZE 8

module full_adder (a,b,c,s,carry);

input a,b,c;
output s,carry;

assign s = a^b^c;
assign carry = (a&b)|(b&c)|(c&a);
    
endmodule


module rca (a,b,cin,sum,cout);

input [(`SIZE-1):0] a,b;
input cin;

output [(`SIZE-1):0] sum;
output cout;

wire [(`SIZE-2):0] w;
genvar i;

full_adder fa0 (a[0],b[0],cin,sum[0],w[0]);

generate for (i=1;i<(`SIZE -1); i=i+1)
    begin

        full_adder fai (a[i],b[i],w[(i-1)],sum[i],w[i]);

    end


endgenerate

full_adder fa (a[`SIZE-1],b[`SIZE-1],w[`SIZE-2],sum[`SIZE-1],cout);

endmodule



//$timeformat(-9,1,"ns",4);