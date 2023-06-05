//active low 

module rs_latch_nand (s,r,q,qn);

input s,r;
output reg q,qn;

always @(*)

    begin
        
        q  = ~(r&qn);
        qn = ~(q&s);
        
    end

endmodule