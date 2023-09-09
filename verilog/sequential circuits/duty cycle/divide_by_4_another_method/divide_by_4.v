`timescale 1ns/1ps

module divide_by_4 (clockin,reset,clockout1,clockout2);

input clockin,reset;
output clockout1,clockout2;



reg q0,q1;
wire d0,d1,d2;

assign d0 = ~q0;
assign d2 = q0;
assign d1 = ~q1;

always @(posedge clockin)
    begin
        if(reset)
            q0 <= 1'b0;
        else
            q0 <= d0; 
    end
    


always @(posedge d2)
        begin
            if(reset)
                q1 <= 1'b0;
            else
                q1 <= d1; 
        end



assign clockout1 = q0;
assign clockout2 = q1;


endmodule