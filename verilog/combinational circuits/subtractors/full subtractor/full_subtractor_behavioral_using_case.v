`timescale 10ns/10ps

module full_adder_behavioral_using_case (a,b,c,d,bo); 

input a,b,c; 

output d, bo; 

reg d ,bo;


always @(a or b or c) 

	begin

	case(a | b | c)

	3'b000 : begin
			d   = 0;
			bo = 0;
			end

	3'b001 : begin
			d   = 1;
			bo = 1;
			end

	3'b010 : begin
			d   = 1;
			bo = 1;
			end

	3'b011 : begin
			d   = 0;
			bo = 1;
			end

	3'b100 : begin
			d   = 1;
			bo = 0;
			end

	3'b101 : begin
			d   = 0;
			bo = 0;
			end

	3'b110 : begin
			d   = 0;
			bo = 0;
			end

	3'b111 : begin
			d   = 1;
			bo = 1;
			end

	end

	endcase

endmodule
