`timescale 10ns/10ps

module mux_2x1_behavioral(i0,i1,s,y);

input i0, i1, s;
output y;

reg y;

always @ (i0 or i1 or s)

begin

y=(s)?i1:i0;

end

endmodule