module sr_ff(clk,s,r,q,qn);

input s,r,clk;

output reg q,qn;

always@(posedge clk)
    begin
    if(~s&~r)
        q <= q;
    else if (~s & r)
        q<= 1'b0;
    else if (s & ~r)
        q<=1'b1;
    else 
        q<=1'bx;
    end


assign qn = ~q;

endmodule