`timescale 10ns/10ps

module decoder_2x4_behavioral_using_case (din,dout);
input [1:0] din;
output [3:0] dout;

reg [3:0] dout ;

always @ (din)
	begin

	case(din)
	0 : dout[0] = 1;
	1 : dout[1] = 1;
	2 : dout[2] = 1;
	3 : dout[3] = 1;

	default : dout = 4'bxxxx;

	endcase
	end
endmodule
