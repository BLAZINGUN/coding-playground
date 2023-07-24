
`include "fifo_test.sv"

module top();

parameter cycle = 10;

reg clock;

fifo_if DUV_IF(clock);

fifo_test test_h;

fifo_rtl dut (  .clk(clock),
                .rst_n(DUV_IF.resetn),
                .wr_enb(DUV_IF.wr_enb),
                .rd_enb(DUV_IF.rd_enb),
                .wr_reg(DUV_IF.wr_reg),
                .rd_reg(DUV_IF.rd_reg),
                .data_in(DUV_IF.datain),
                .full(DUV_IF.full),
                .empty(DUV_IF.empty),
                .threshold(DUV_IF.threshold),
                .overflow(DUV_IF.over_flow),
                .underflow(DUV_IF.underflow),
                .data_out(DUV_IF.dataout)   );


//binding assertions

bind dut fifo_assertions a1 (clock,resetn,wr_ptr,wr_enb,wr_reg);
bind dut fifo_assertions a2 (clock,resetn,rd_ptr,rd_enb,rd_reg)

initial 
    begin
        test_h = new(DUV_IF,DUV_IF,DUV_IF,DUV_IF);       
        test_h.build_and_run();
    end

initial
    begin
        clock = 1'b0;
        forever #(cycle/2) clock = ~clock;
    end

    

endmodule
