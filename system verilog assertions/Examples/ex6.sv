//when the positive edge of a signal a is detected, check signal b has to be high continuously until c goes low

property p1;
    @(poseedge clk)
    $rose(a) |=> (b throughout (!c[->1]));
endproperty


