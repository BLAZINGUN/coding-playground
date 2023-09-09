`timescale 1ns/1ps

module divide_by_1_5(clockin,reset,clockout);

input clockin,reset;
output clockout;

reg [2:0]count;

reg phase_shift_count_1;

//ring counter to select and shift the desired signals
always@ (posedge clockin)
    begin
        if(reset)
            count <= 3'b001;
        else
            begin
                count <= count << 1;
                count[0] <= count[2];
            end   
    end


//shifting the required individual signals by half pulse
always@(negedge clockin)
    begin
        if(reset)
            phase_shift_count_1 <= 0;
        
        else
            begin
                phase_shift_count_1 <= count[1];
            end
    end



assign clockout = (phase_shift_count_1|count[0]);


endmodule