//verify jk flipflop

property no_change;
    @(posedge clk) 
    disable iff (reset)

    !j && !k |=> q == $past(q,1);
endproperty

property rst;
    @(poseedge clk)
    disable iff(reset)
    !j && k |=> !q;
endproperty

property set;
    @(posedge clk)
    disable iff(reset)
    j && !k |=> q;
endproperty

property toggle;
    @(posedge clk)
    disable iff(reset)
    j && k |=> q != $past(q,1);
endproperty

property reset_;
    @(posedge clk)
    reset |=> !q;
endproperty