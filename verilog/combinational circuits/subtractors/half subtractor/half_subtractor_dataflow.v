`timescale 10ns/10ps
module half_subtractor(a,b,d,bo);
input a,b;
output d,bo;

assign d = a ^ b;
assign bo = ~a & b;

endmodule