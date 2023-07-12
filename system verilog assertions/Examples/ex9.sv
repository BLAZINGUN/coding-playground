//to verify fsm which detects the sequencee "101"

property rst;
    @(posedge clk)
    reset |=> (state == s0) && (d_out == 0);
endproperty

property fsm1;
    @(posedge clk)
    disable iff(reset)
(state == s0) && (din == 1) |=> (state == s1) && (dout == 0);
endproperty

/*
alternate way

property fsm1;
    @(posedge clk)
    disable iff(reset)
    (state == s0) |=> if($past(din,1))
                        state == s1 && dout ==0
                      else
                        state == s0 && dout ==0;
endproperty
*/

property fsm2;
    @(posedge clk)
    disable iff(reset)
    (state == s1) |=> if($past(din, 1))
                    state == s1 && dout == 0
                    else
                    state == s2 && dout == 0;
endproperty

property fsm3;
    @(posedge clk)
    disable iff(reset)
    (state == s2) |=> if($past(din, 1))
                    state == s3 && dout == 1
                    else
                    state == s0 && dout == 0;
endproperty

property fsm4;
    @(posedge clk)
    disable iff(reset)
    (state == s3) |=> if($past(din, 1))
                    state == s1 && dout == 0
                    else
                    state == s2 && dout == 0;
endproperty