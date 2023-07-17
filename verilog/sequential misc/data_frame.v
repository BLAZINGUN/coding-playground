module frame(clk,reset,sof,pri,eof);

input clk,reset;
output reg sof,pri,eof;

reg [31:0] delay_50,count,pulse_count;

always@(posedge clk)
    begin
        if(reset)
            {eof,pri,sof} <=3'bxxx ;

        else
            begin
                count <= count+1'b1;

                if(count < 4)
                    begin
                        sof <= 1'b1;
                        delay_50 <= 1'b0;
                    end
                else 
                    begin
                        sof <= 1'b0;

                        delay_50 <= delay_50 + 1'b1;

                        if(count >= 5144 && count <= 5156)
                            begin
                                eof <= 1'b1;
                                {sof,pri} < = 2'b00;
                            end
                        else 
                            eof <= 1'b0;
                        

                        if (delay_50 >= 50 && delay <= 5050)
                            begin

                                if(pulse_count >= 100)
                                    begin
                                        pulse_count <= 1'b0;
                                    end

                                else
                                    begin
                                        
                                        if(pulse_count >= 30)
                                            begin
                                                pri <= 1'b0;
                                                pulse_count <= pulse_count + 1'b1;
                                            end
                                        else
                                            begin
                                                pri <= 1'b1;
                                                pulse_count <= pulse_count + 1'b1;
                                            end
                                    end   
                            end
                    end    
            end
    end

endmodule