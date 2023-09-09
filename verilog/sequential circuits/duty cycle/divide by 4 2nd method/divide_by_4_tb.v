`timescale 1ns/1ps

module divide_by_4_tb;

reg clockin,reset;
wire clockout;
wire [2:0] count;

divide_by_4 dut (clockin,reset,count,clockout);

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
        $monitor("at time : %t , clockin = %b , reset = %b , clockout = %b ",$time,clockin,reset,clockout);
    end

endmodule