//assertion to verify clock with 50% duty cycle of any given time period

property t_peeriod (int clk_period);
    time current_time;
    @(edge clk)
    ('1 , current_time = $time) |=> (clk_period/2  == ($time-current_time)); 
endproperty

