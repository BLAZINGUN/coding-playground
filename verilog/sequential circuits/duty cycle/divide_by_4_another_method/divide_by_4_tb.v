`timescale 1ns/1ps

module divide_by_4_tb;

reg clockin,reset;
wire clockout1,clockout2;

divide_by_4 DUT (clockin,reset,clockout1,clockout2);

initial 
    begin
        clockin = 0;
        forever #5 clockin = ~clockin;  //timeperiod = 10ns        
    end

initial
    begin
        reset = 1;
        #20 reset = 0;
        #100 $finish;
    end

initial 
    begin
        $monitor("at time : %t , clockin = %b , reset = %b , clockout1 = %b , clockout2 = %b ",$time,clockin,reset,clockout1,clockout2);
    end

endmodule