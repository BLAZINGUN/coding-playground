`timescale 10ns/10ps
module mux_8x1_behavioral_using_case (a,b,c,d,e,f,g,h,s0,s1,s2,y);  

input a,b,c,d,e,f,g,h,s0,s1,s2;
output y; 

reg y;

always @ (*) 

begin

case (s0|s1|s2)
 
 		3'b000 : y <= a;
 		3'b001 : y <= b;
 		3'b010 : y <= c;
 		3'b011 : y <= d;
 		3'b100 : y <= e;
 		3'b101 : y <= f;
 		3'b110 : y <= g;
 		3'b111 : y <= h;


endcase

end



endmodule