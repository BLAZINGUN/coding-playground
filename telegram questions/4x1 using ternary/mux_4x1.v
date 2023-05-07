`timescale 1ns/1ps

module mux_4x1(in,s1,s2,out);

input [3:0] in;
input s1,s2;

output out;



assign out = s2  ? (s1  ? in[3] : in[2])   : (s1  ? in[1] : in[0]) ;

endmodule