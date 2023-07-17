property p1;
    @(posedge clk)
    disable iff (reset)
    mode |=> q == $past(q,1) +1 ;
endproperty