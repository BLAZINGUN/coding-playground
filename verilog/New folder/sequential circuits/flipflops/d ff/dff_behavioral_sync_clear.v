`timescale 10ns/10ps

module dff_behavioral_sync_clear(d,clk,clear,q,qbar); 
input d, clk, clear; 
output reg q, qbar; 

always@(posedge clk) 

begin
if(clear== 1)
q <= 0;
qbar <= 1;
else 
q <= d; 
qbar = ~d; 
end 
endmodule