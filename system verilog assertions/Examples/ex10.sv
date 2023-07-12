
//whenever valid signal goes high, enable signal should be asserted in the next cycle & it should be stable till ready signal is asserted. the ready signal should be asserted after enable within 4 - 6 cycles

property p1;
    @(posedge clk)
    $rose(valid) |=> enable[*4:6] ##1 ready;
endproperty