
`timescale 1ns/1ps  

module divide_by_2_tb;

reg clkin,reset;
wire clkout;

divide_by_2 dut (clkin,reset,clkout);

initial begin
    clkin = 0;
    forever begin
        #5 clkin = ~clkin;
    end
end

initial
    begin
        reset = 1;
        #10 reset = 0;
    end

initial
       $monitor("at time : %t , clockin = %b , reset = %b , clockout = %b ",$time,clockin,reset,clockout);


endmodule