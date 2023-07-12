//when the signal a goes high , from the next cycle , thee signal b should repeat n number of times, where n is equal to the value of bit[3:0] c wheen a is asserted.

property p1;
    int local,count;
    @(posedge clk) 
    ($rose(a) , local=c,count=0) |=> $rose(b) ##1(b,count++)[*1:$] ##1 (!b && (count == local-1));
endproperty