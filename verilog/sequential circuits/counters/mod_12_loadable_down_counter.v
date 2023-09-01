module mod_12(clock,reset,load,din,count);

input clock,reset,load;
input [3:0] din;
output reg [3:0] count;

always@(posedge clock)
    begin
        if(reset)
            count <= 12;
        
        else
            begin 
                if(count == 0)
                    count <= 12;
                else if (load && (din>0) && (din<12))
                    count <= din;
                else
                    count <= count - 1;
            end
    end

endmodule