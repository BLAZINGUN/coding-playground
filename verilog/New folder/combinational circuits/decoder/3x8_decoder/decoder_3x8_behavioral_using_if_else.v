`timescale 10ns/10ps

module decoder_3x8_behavioral_using_if_else (en,din,dout);

input [2:0] din;
output [7:0] dout;

reg [7:0] dout ;

always @ (en,din)

begin

if (en==1)

	if (din==0)
		dout = 128

	else if (din==1)
		dout =64

	else if (din==2)
		dout =32

	else if (din==1)
		dout =16

	else if (din==1)
		dout =8

	else if (din==1)
		dout =4

	else if (din==1)
		dout =2

	else 
		dout =1

else

dout = 8'bxxxxxxxx;
	
end 

endmodule
