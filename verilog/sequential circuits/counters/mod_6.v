module mod_6(clock,reset,count);

input clock,reset;
output reg [1:0] count;

always@(posedge clock)

    begin
        
        if(reset)
            count <= 0;
        
        else
            begin 
                if(count == 6)
                    count <= 0;
                else
                    count <= count + 1;
            end
    end

endmodule