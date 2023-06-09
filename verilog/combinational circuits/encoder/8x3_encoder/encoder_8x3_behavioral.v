`timescale 10ns/10ps



module encoder_8x3_dataflow(din, a, b, c);

input [0:7] din;
output a,b,c;

reg a,b,c;

always @ (*)

begin


assign a = din[4] | din[5] | din[6] | din[7];
assign b = din[2] | din[3] | din[6] | din[7];
assign c = din[2] | din[4] | din[6] | din[7];


end

endmodule