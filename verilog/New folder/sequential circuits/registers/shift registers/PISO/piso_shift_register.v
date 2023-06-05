`timescale 10ns/10ps

module piso_shift_register (Clk, pi,load, so);

input Clk,load;
input [3:0]pi;
output reg so;

reg [3:0]tmp;

always @(posedge Clk)

begin

if(load)
tmp<=pi;
else

begin

so<=tmp[3];
tmp<={tmp[2:0],1'b0};

end

end

endmodule