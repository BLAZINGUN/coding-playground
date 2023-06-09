`timescale 10ns/10ps

module decoder_2x4_behavioral_using_if_else (din,dout);
input [1:0] din;
output [3:0] dout;

reg [3:0] dout ;

always @ (en,din)

begin

if (din==0)
	dout = 8

else if (din==1)
	dout =4

else if (din==2)
	dout =2

else 
	dout =1
	
end 

endmodule
