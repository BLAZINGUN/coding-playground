//when signal d changes to 1, on next cycle , if signal b is true , then signal c should be high continuously or intermittently for 2 clock cycles , followeed by high on signal a in thee next cycle , elsee the signal a should bee high continuously orr intermittently for 2 clock cycles , followed by high on signal c in the next cycle.

property p1;
    @(posedge clk)
    $rose(d) |=> if(b)
                c[->2] ##1 a;
                else
                a[->2] ##1 c;
endproperty

