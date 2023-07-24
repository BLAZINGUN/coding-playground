
`include "fifo_test.sv"

module top();

parameter cycle = 10;

reg clock;

    fifo_if DUV_IF(clock);

    fifo_test test_h;

    fifo DUT ();

    initial 
        begin
            test_h = new();       
        end

    

endmodule
