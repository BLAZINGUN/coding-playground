`timescale 10ns/10ps

module 8_bit_reg_with_async_reset (reset, CLK, D, Q);

input reset;
input CLK;
input [7:0] D;
output [7:0] Q;
reg [7:0] Q;

always @(posedge CLK or posedge reset)

begin

if (reset)
Q = 0;
else
Q = D;

end

endmodule