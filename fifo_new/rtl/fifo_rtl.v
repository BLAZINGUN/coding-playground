module fifo_rtl(input clk, rst_n,
                                input wr_enb, rd_enb, wr_reg, rd_reg,
                                input [7:0] data_in,
                                output full, empty, threshold,
                                output reg overflow, underflow,
                                output reg [7:0] data_out);

        reg [7:0] fifo_ram [15:0];
        reg [7:0] limit;
        wire[3:0] ptr_difference;
        reg [4:0] wr_ptr, rd_ptr;
        integer i;

        assign iteration = (wr_ptr[4] ^ rd_ptr[4]);
        assign ptr_equal = ((wr_ptr[3:0] == rd_ptr[3:0]) ? 1:0);
        assign full = (iteration & ptr_equal);
        assign empty = (~iteration & ptr_equal);
        assign ptr_difference = (iteration == 0) ? (wr_ptr[3:0] - rd_ptr[3:0]) : (5'd16 - rd_ptr[3:0] + wr_ptr[3:0]);
        assign threshold = full ||((ptr_difference >= limit) ? 1:0);


        always @(posedge clk)
                begin
                        if(!rst_n)
                                begin
                                        overflow <= 0;
                                        underflow <= 0;
                                end
                        else
                                begin
                                        if(empty && (rd_enb & !rd_reg ))
                                                underflow <= 1;
                                        else
                                                underflow <= 0;

                                        if(full && (wr_enb & !wr_reg))
                                                overflow <= 1;
                                        else
                                                overflow <= 0;
                                end
                end

        always @(posedge clk)
                begin
                        if(!rst_n)
                                begin
                                        for(i = 0; i<16; i = i+1)
                                                fifo_ram[i] <= 8'b0;

                                        limit <= 8;
                                end
                        else if(wr_reg)
                                limit <= data_in;
                        else if(~full & wr_enb & !wr_reg)
                                fifo_ram[wr_ptr[3:0]] <= data_in;
                end

        always @(posedge clk)
                begin
                        if(!rst_n)
                                data_out <= 8'b0;
                        else if (rd_reg)
                                data_out <= limit;
                        else if(~empty & rd_enb & !rd_reg)
                                begin
                                        data_out <= fifo_ram[rd_ptr];
                                end
                        else
                                data_out <= 0;
                end

        always @(posedge clk)
                begin
                        if(~rst_n)
                                rd_ptr <= 5'b00000;
                        else if(~empty & rd_enb & !rd_reg)
                                rd_ptr <= rd_ptr + 5'b00001;
                end

        always @(posedge clk)
                begin
                        if(~rst_n)
                                wr_ptr <= 5'b00000;
                        else if(~full & wr_enb & !wr_reg)
                                wr_ptr <= wr_ptr + 5'b00001;
                end

endmodule
~
