//dff with assign - deassign

module dff_assign (q,qb,di,clk,clr,pr);

output q,qb;
input di,clk,clr,pr;

reg q;

assign qb = ~q;

always @ (clr or pr)

    begin
        
       if(clr) 
            assign q = 1'b0;

        if(pr)
            assign q =1'b1;
        
        else 
            deassign q;
    end

always @ (posedge clk)

    begin
       
        q <= di;


    end

endmodule






//counter with continuous procedural assignment

module counter (a,n,clr,pr,clk);

output reg [7:0] a;
input [7:0] n;

input clr,pr,clk;


initial 
    begin
        a = 8'h00;
    end


always @ (posedge clk)
    begin
        a = a + 1'b1;
    end

always @(clr or pr)
    if(clr)
        assign a = 7'h00;
    else if (pr)
        assign a = n;
    else begin
        deassign a;
    end

endmodule
