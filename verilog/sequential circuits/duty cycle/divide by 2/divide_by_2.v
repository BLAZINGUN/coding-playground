`timescale 1ns/1ps

module divide_by_2(clockin,reset,clockout);


input clockin,reset;
output clockout;

wire clockoutb;

assign clockoutb = ~clockout;

dff d1(clockoutb,clockin,reset,clockout,clockoutb);

endmodule



module dff(din,clock,reset,q,qb);

input din,clock,reset;
output reg q;
output qb;

always @(posedge clock) 
    begin
        if(reset)
            q<=0;
        else 
            q<=din;
    end

assign qb = ~q;

endmodule