module divide_by_4(clockin,reset,count,clockout);

input clockin,reset;
output reg [2:0] count;
output clockout;


always@(posedge clockin)

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

assign clockout = count[1];

endmodule