`timescale 1ns/1ps

module mux_4x1_tb;

reg [3:0] in;
reg s1,s2;

wire out;


mux_4x1 DUT (in,s1,s2,out);

initial

	begin
		in = 0;

		#10
		in = 4'b0001;
		{s2,s1} = 2'b00;

		#10
		in = 4'b0010;
		{s2,s1} = 2'b01;

		#10
		in = 4'b0100;
		{s2,s1} = 2'b10;

		#10
		in = 4'b1000;
		{s2,s1} = 2'b11;



$monitor(" at time %t , the value of in is %b and the value of s2 is %b , s1 is %b", $time , in , s2 , s1 );

	end

endmodule