module sr_latch(s,r,en,q,qn);

input s,,enr;
output q,qn;

wire w1,w2;

assign qn =~q;

nand n1 (w1,s,en);
nand n2 (w2,r,en);

nand n3 (q,w1,qn);
nand n4 (qn,w2,q);

endmodule



always @ (*)
    begin
        
        
        w1 = ~(s&en); 
        w2 = ~(r&en);

        q  = ~(w1&qn);
        qn = ~(w2&q);

    
    end

endmodule