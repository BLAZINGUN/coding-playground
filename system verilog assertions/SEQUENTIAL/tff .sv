property p1;
    @(posedge clk)
    disable iff(reset)
    t |=> q != $past(q,1);
endproperty

property rst;
    @(posedge clk)
    reset|=> !q;
endproperty

property p2;
    @(posedge clk)
    disable iff(reset)
    !t |=> q == $past(q,1);
endproperty

