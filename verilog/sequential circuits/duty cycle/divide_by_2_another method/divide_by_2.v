`timescale 1ns/1ps  

module divide_by_2(clkin,reset,clkout);

input clkin,reset;
output reg clkout;

always @(posedge clkin ) 
    begin
        if(reset)
            clkout <= 0;
        else
            clkout <= ~clkout;
    end

endmodule


