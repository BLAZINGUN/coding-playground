`timescale 10ns/10ps

module encoder_8x3_behavioral_using_case ( din , dout );

input [7:0] din ;
output [2:0] dout ;



reg [2:0] dout ;
wire [7:0] din ;

always @ (din) begin

 case (din)
  128 : dout = 7;
  64  : dout = 6;
  32  : dout = 5;
  16  : dout = 4;
  8   : dout = 3;
  4   : dout = 2;
  2   : dout = 1;
  1   : dout = 0;
 
  default : dout = 3'bZ;
 endcase
end

endmodule