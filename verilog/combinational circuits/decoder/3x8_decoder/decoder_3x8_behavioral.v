`timescale 10ns/10ps

module decoder_3x8_dataflow (
	input [2:0] a,
    output [7:0] d );

reg [7:0] d ;


always @ (en,a)

begin

assign d[0] = (~a[2]) & (~a[1]) & (~a[0]) & (en);
assign d[1] = (~a[2]) & (~a[1]) & (a[0])  & (en);
assign d[2] = (~a[2]) & (a[1])  & (~a[0]) & (en);
assign d[3] = (~a[2]) & (a[1])  & (a[0])  & (en);
assign d[4] = (a[2])  & (~a[1]) & (~a[0]) & (en);
assign d[5] = (a[2])  & (~a[1]) & (a[0])  & (en);
assign d[6] = (a[2])  & (a[1])  & (~a[0]) & (en);
assign d[7] = (a[2])  & (a[1])  & (a[0])  & (en);

end

endmodule