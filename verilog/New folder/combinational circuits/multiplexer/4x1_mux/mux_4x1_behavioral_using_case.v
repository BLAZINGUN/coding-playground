`timescale 10ns/10ps
module mux_4x1_behavioral_using_case (a,b,c,d,s0,s1,y);  

input a,b,c,d,s0,s1;
output y;

reg y;

always @ (*) 

begin

case (s0|s1)
 
 		2'b00 : y <= a;
 		2'b01 : y <= b;
 		2'b10 : y <= c;
 		2'b11 : y <= d;

endcase

end



endmodule