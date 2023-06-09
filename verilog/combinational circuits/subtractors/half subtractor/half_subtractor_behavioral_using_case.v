`timescale 10ns/10ps

module half_subtractor_behavioral_using_case(a,b,d,bo);
input a,b;
output d,bo;

reg d,bo;


always @(a or b) 

	begin

	case(a | b )

	2'b00 : begin
			d   = 0;
			bo = 0;
			end

	2'b01 : begin
			d   = 1;
			bo = 1;
			end

	2'b10 : begin
			d   = 1;
			bo = 0;
			end

	2'b11 : begin
			d   = 0;
			bo = 0;
			end

	end

	endcase


endmodule