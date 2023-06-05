`timescale 10ns/10ps

`timescale 10ns/10ps

module full_subtractor_behavioral(a,b,c,d,bo);
input a,b,c;
output d,bo;

reg d,bo;

always @ (a or b or c )

begin

assign d  = a ^ b ^ c;
assign bo = ~a & (b^c) | b & c;

end

endmodule