module mod_12_down (clock,reset,count);

input clock,reset;
output reg [3:0] count;

always@(posedge clock)
    begin
        
        if(reset)
            count <= 0;
        
        else
            begin 
                if(count == 0)
                    count <= 12;
                else
                    count <= count - 1;
            end
    end

endmodule