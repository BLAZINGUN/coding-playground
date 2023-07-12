at posedge clock if signal a is asserted , then in the next clock cycle b should go high and c should beee stable. Th signal c should not change until b goes low.once b goees low, in the same cycle c should change.


sequence s1;
    ($stable(c) [*1:$] intersect b[*1:$]);
endsequence

property p1;
    @(posedge clk)
    $rose(a) |=> b && $stable(c) ##1 s1 ##1 $changed(c) && $fell(b);
endproperty

