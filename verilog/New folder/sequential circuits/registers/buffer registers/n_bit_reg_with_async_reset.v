`timescale 10ns/10ps

module n_bit_reg_with_async_reset (reset, CLK, D, Q);

input reset;
input CLK;

//parameter N = 8; // Allow N to be changed

input [N-1:0] D;
output [N-1:0] Q;
reg [N-1:0] Q;

always @ (posedge CLK or posedge reset)

begin

if (reset)
Q = 0;
else if (CLK == 1)
Q = D;

end

endmodule