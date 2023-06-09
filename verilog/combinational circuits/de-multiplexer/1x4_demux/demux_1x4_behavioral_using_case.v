`timescale 10ns/10ps

module demux_1x4_behavioral_using_case (din,s,y);

input din;
input [1:0] s;
output [3:0] y;

reg y

always @ (*)

begin

case (s)

	2'b00 : y[0] <= din;
	2'b01 : y[1] <= din;
	2'b10 : y[2] <= din;
	2'b11 : y[3] <= din;

endcase

end

endmodule