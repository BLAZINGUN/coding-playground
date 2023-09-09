module divide_by_4(clockin,reset,clockout);

input clockin,reset;
output reg clockout;

wire w1,w2,w3;

dff d1 (w1,clockin,reset,w2,w1);
dff d2 (w3,w2,reset,clockout,w3);

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