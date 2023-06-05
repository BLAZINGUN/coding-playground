`timescale 10ns/10ps
module mux_8x1_dataflow (a,b,c,d,e,f,g,h,s0,s1,s2,y);  

input a,b,c,d,e,f,g,h,s0,s1,s2;
output y; 

assign y = s2 ? (s1 ? (s0 ? h : g) : (s0 ? f : e)):(s1 ? (s0 ? d : c) : (s0 ? b : a)); 

endmodule