module down_counter(clk,reset,count);

input clk,reset;

output reg [3:0]count;



always @(posedge clk)
    begin
        if(reset)
            count <= 4'b1111;
        else 
            count <= count - 1'b1;
    end

endmodule