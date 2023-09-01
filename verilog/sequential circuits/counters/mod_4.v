module mod_4(clock,reset,count);

input clock,reset;
output reg [2:0] count;

always@(posedge clock)

    begin
        
        if(reset)
            count <= 0;
        
        else
            begin 
                if(count == 4)
                    count <= 0;
                else
                    count <= count + 1;
            end
    end

endmodule