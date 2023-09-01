module mod_12(clock,reset,load,din,count);

input clock,reset,load,mode;
input [3:0] din;
output reg [3:0] count;

always@(posedge clock)
    begin
        
        if(mode)
            begin
                if(reset)
                    count <= 0;    
                else
                    begin 
                        if(count == 12)
                            count <= 0;
                        else if (load && (din>0) && (din<12))
                            count <= din;
                        else
                            count <= count + 1;
                    end
            end

        else(!mode)
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