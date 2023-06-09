`timescale 10ns/10ps


module decoder_2x4_dataflow (en,a,d);
 input en;
 input [1:0] a;
 output [3:0] d;

 assign d[0] =(en  & ~a[1]  & ~a[0]);
 assign d[1] =(en  & ~a[1]  &  a[0]);
 assign d[2] =(en  &  a[1]  & ~a[0]);
 assign d[3] =(en  &  a[1]  &  a[0]);

endmodule