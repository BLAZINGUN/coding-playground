module fifo(clk,rst,din,dout,we,re,full,eempty);

parameter fifo_width = 32 , fifo_depth = 2**addr_size , addr_size = 3;

input clk,rst,we,re;
input [fifo_width - 1 : 0] din;
output [fifo_width - 1 : 0] dout;
output full,empty;

reg [addr_size - 1 : 0] rd_ptr,wr_ptr;
reg [addr_size : 0] fifo_counter;
reg [fifo_width-1 : 0] mem [fifo_depth-1 : 0];

integer i;

assign full = (fifo_counter == fifo_depth) ? 1'b1 : 1'b0;
assign empty = (fifo_counter == 0) ? 1'b1 : 1'b0;


// logic for fifo_counter
always @(posedge clk) 
    begin
        if(rst)
            fifo_counter <= 0;
        else if (!full && we)
            fifo_counter <= fifo_counter + 1'b1;
        else if (!empty && re)
            fifo_counter <= fifo_counter - 1'b1;
        else    
            fifo_counter <= fifo_counter;
    end



//write operation

always @(posedge clk)
    begin

        if(rst)
            begin
                for (i=0;i<fifo_depth;i=i+1)
                    begin
                        mem[i] <= 0 ;
                    end
                wr_ptr <= 0;
            end     
        else
            begin
                mem[wr_ptr] <= din;
                wr_ptr <= wr_ptr + 1'b1;
            end

    end



//read operation

always@(posedge clk)
    begin
        
        if(rst)
            begin
                dout <= 0;
                rd_ptr <= 0;
            end
        else
            if(re && !empty) 
                begin
                    dout <= mem[rd_ptr];
                    rd_ptr <= rd_ptr + 1'b1;
                end

    end

endmodule

