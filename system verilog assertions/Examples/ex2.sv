//assertion to verify divide by two circuit

property divide;
    @(posedge clk)
    disable iff(reset)
    (q != $past(q,1));
endproperty
