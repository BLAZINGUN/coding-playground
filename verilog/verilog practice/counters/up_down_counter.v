module up_down_counter(clk,reset,mode,count);

input clk,reset,mode;
output reg [3:0]count;

always@(posedge clk)

    begin
        if (reset)
            begin

                if(mode == 1'b1)
                    count <= 4'b0000;
                else if (mode == 1'b0)
                    count <= 4'b1111;
                else
                    count <= 4'bxxxx;

            end 

        else
            begin
               if(mode ==1'b1)
                    begin
                        if(count == 4'b1111)
                            count <= 4'b0000;
                        else 
                            count <= count + 1'b1;
                    end

                else if (mode == 1'b0)
                    begin
                        if(count == 4'b0000)
                            count <= 4'b1111;
                        else
                            count <= count - 1'b1;
                    end 
            end


    end

endmodule