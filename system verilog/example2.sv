module example(clk,reset,x,y);

input clk,reset;
input [3:0] x;
output reg [3:0] y;


always @(posedge clk)
    begin
        if(reset)
            begin
                y <= 0 ;
            end 
        else
            begin

                if (x < 3)
                    y <= 0;
                else if (x == 3 )
                    y <= y+1;

            end
    end

endmodule


