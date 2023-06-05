`timescale 10ns/10ps

module decoder_3x8_behavioral_using_case (din,dout);
input [2:0] din;
output [7:0] dout;

reg [7:0] dout ;

always @ (din)
	begin

	case(din)
	0 : dout[0] = 1;
	1 : dout[1] = 1;
	2 : dout[2] = 1;
	3 : dout[3] = 1;
	4 : dout[4] = 1;
	5 : dout[5] = 1;
	6 : dout[6] = 1;
	7 : dout[7] = 1;


	default : dout = 4'bxxxx;

	endcase
	end
endmodule