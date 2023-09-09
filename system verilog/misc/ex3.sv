module example(clk,reset,x,y);

input clk,reset;
output reg [3:0] x,y;


always @(posedge clk)
    begin
        if(reset)
            begin
                {x,y} <= 0 ;
            end 
        else
            begin
                x <= x+1;
                y <= y+1;
            end
    end


always @(posedge clk)
    begin
        if(x<3)
            begin
                assign y <= 0;          
            end
        else if (x == 3)
            begin
                assign x <= 3;
            end

        else 
            begin
                deassign y;
                deassign x;
            end
    end

endmodule