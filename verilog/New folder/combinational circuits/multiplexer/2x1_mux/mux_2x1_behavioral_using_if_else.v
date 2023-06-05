`timescale 10ns/10ps

module mux_2x1_behavioral(i0,i1,s,y);

output y;
input i0, i1, s;

reg y;

always @(i0 or i1 or s)
begin

if(s) 
y= i1;
else
y=i0;

end

endmodule