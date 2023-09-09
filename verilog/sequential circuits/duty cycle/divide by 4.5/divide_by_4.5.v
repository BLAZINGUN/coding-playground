`timescale 1ns/1ps

module divide_by_4_5(clockin,reset,clockout);

input clockin,reset;
output clockout;

reg [8:0]count;

reg phase_shift_count_1,phase_shift_count_4,phase_shift_count_5;

//ring counter to select and shift the desired signals
always@ (posedge clockin)
    begin
        if(reset)
            count <= 9'b000000001;
        else
            begin
                count <= count << 1;
                count[0] <= count[8];
            end   
    end


//shifting the required individual signals by half pulse
always@(negedge clockin)
    begin
        if(reset)
            {phase_shift_count_1,phase_shift_count_4,phase_shift_count_5} <= 0;
        
        else
            begin
                phase_shift_count_1 <= count[0];
                phase_shift_count_4 <= count[4];
                phase_shift_count_5 <= count[5];
            end
    end



assign clockout = (phase_shift_count_1|phase_shift_count_4|phase_shift_count_5|count[0]|count[1]|count[5]);


endmodule