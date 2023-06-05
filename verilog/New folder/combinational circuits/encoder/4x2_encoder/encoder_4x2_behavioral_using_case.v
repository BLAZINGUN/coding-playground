`timescale 10ns/10ps

module encoder_4x2_behavioral_using_case ( din , dout );

input [3:0] din ;
output [1:0] dout ;



reg [1:0] dout ;
wire [3:0] din ;

always @ (din) begin

 case (din)
  4'b0001 : dout = 2'b00;
  4'b0010 : dout = 2'b01;
  4'b0100 : dout = 2'b10;
  4'b1000 : dout = 2'b11;
 
  default : dout = 2'bZ;
 endcase
end

endmodule