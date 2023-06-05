`timescale 10ns/10ps

module demux_1x4_dataflow ( A, din, Y);

input din;
input [1:0] A;
output reg [3:0] Y;

always @ (*)

begin

assign Y[0] = din & (~A[0]) & (~A[1]);
assign Y[1] = din & (~A[1]) & A[0];
assign Y[2] = din & A[1] & (~A[0]);
assign Y[3] = din & A[1] & A[0];

end

endmodule