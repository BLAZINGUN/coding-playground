`timescale 10ns/10ps
module mux_4x1_dataflow (a,b,c,d,s0,s1,y);  

input a,b,c,d,s0,s1;
output y; 

assign y = s1 ? (s0 ? d : c) : (s0 ? b : a); 

endmodule