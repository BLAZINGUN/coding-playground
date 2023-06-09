//active high

module rs_latch_nor (s,r,q,qn);

input s,r;
output reg q,qn;

always @ (*)

    begin

        q  = ~(qn|r);
        qn = ~(q|s);

    end

endmodule




