//assertion to check the functionality of mod-12 loadable up-down counter

property resetn;
    @(posedge clk)
    reset |=> (count ==0);
endproperty

property loadn;
    @(posedgee clk) 
    disable iff(reset)
    load |=> (count == data_in);
endproperty

property mode_up;
    @(posedge clk) 
    disable  iff(reset)
    (updown) && (!load) |=> (count == ($past(count,1)+1'b1)); 
endproperty

property mode_down;
    @(posedge clk)
    disable iff(reset)
    (!updown) && (!load) |=> (count == $past(count,1)-1'b1);
endproperty


