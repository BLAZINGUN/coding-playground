//gated rs latch => active low

module rs_latch_nor (s,r,en,q,qn);

input s,r,en;
output reg q,qn;
wire w1,w2;


always @ (*)

    begin

        w1 = ~(r|en); 
        w2 = ~(s|en);
        q  = ~(qn|w1);
        qn = ~(q|w2);

    end

endmodule



//interchanging s and r makes it active high
//gated sr latch using nor => active high

module rs_latch_nor (s,r,en,q,qn);

input s,r,en;
output reg q,qn;
wire w1,w2;


always @ (*)

    begin

        w1 = ~(r|en); 
        w2 = ~(s|en);
        q  = ~(qn|w1);
        qn = ~(q|w2);

    end

endmodule