module mod_3(clock,reset,count);

input clock,reset;
output reg [1:0] count;

always@(posedge clock)

    begin
        
        if(reset)
            count <= 0;
        
        else
            begin 
                if(count == 3)
                    count <= 0;
                else
                    count <= count + 1;
            end
    end

endmodule