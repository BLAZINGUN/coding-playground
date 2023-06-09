module up_counter(clk,reset,count);


input clk,reset;
output [3:0]count;


always@(posedge clk)

    begin
        
        if (reset)
            count <= 4'b0000;
        else
            count <= count + 1'b1;

    end


endmodule