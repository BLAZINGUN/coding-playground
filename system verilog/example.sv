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
                y <= y+1;
            end
    end


always @(posedge clk)
    begin
        if(y>=1 && y<=3)
            begin
              x <= 4'b1;  
            end
        else if (y>=4  && y<=6)
            begin
                x <= 4'b2; 
            end
        else if (y>=7 && y<=9)
            begin
                x <= 4'b3;
            end
    end

endmodule