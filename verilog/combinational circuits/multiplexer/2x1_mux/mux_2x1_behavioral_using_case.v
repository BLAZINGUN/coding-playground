`timescale 10ns/10ps

module mux_2x1_behavioral_using_case(i0,i1,s,y);

output y;
input i0, i1, s;

reg y;

always @(i0 or i1 or s)
begin

case (s)
     
     0 : y=i0;
     1 : y=i1;
     default : y = 1'bx;

endcase



end

endmodule