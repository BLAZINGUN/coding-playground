//to generate a clock signal with frequency 25MHz and duty cycle 25%

`timescale 1ns/1ps

module clock_generation(in,out);

input in;
output out;
reg clock = 0;

parameter freq = 239*1e5;
parameter time_period = (1/freq)*1e9;
parameter on_time = (time_period/2);
parameter off_time = (time_period/2);


always
	begin
		#offtime clock = ~clock;
		#on_time clock = ~clock;
	end

assign out = clock;

endmodule