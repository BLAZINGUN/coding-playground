module half_adder (a,b,clk,sum,carry);

input a,b,clk;
output sum,carry;


always @ (posedge clk)
    begin
        sum = a^b;
        carry = a&b;
    end

property p1;
    @(posedge clk)
        if(a==0 && b ==0)
            (sum == 0 & carry == 0);
endproperty

property p2;
    @(posedge clk)
        if(a==0 && b ==1)
            (sum == 1 & carry == 0);  
endproperty


property p3;
    @(posedge clk)
        if(a==1 && b ==0)
            (sum == 1 & carry == 0);
endproperty


property p4;
    @(posedge clk)
        if(a==1 && b ==1)
            (sum == 0 & carry == 1);
endproperty


initial 

    begin
        a1: assert property(p1);
                $display("assertion p1 passed");
            else
                $display("assertion p1 failed");

        b2: assert property(p2);
                $display("assertion p2 passed");
            else
                $display("assertion p2 failed");

        c3: assert property(p3);
                $display("assertion p3 passed");
            else
                $display("assertion p3 failed");

        d4: assert property(p4);
                $display("assertion p4 passed");
            else
                $display("assertion p4 failed");

    end

endmodule