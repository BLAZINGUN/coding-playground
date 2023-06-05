`timescale 10ns/10ps
module half_subtractor(a,b,d,bo);
input a,b;
output d,bo;

reg d,bo;

always @(a or b)

begin

assign d = a ^ b;
assign bo = ~a & b;

end

endmodule