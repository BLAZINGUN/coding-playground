`timescale 10ns/10ps

module full_adder_behavioral_using_case (a,b,cin,sum,carry); 

input a,b,cin; 

output sum, carry; 

reg sum ,carry;


always @(a or b or cin) 

	begin

	case(a | b | cin)

	3'b000 : begin
			sum   = 0;
			carry = 0;
			end

	3'b001 : begin
			sum   = 1;
			carry = 0;
			end

	3'b010 : begin
			sum   = 1;
			carry = 0;
			end

	3'b011 : begin
			sum   = 0;
			carry = 1;
			end

	3'b100 : begin
			sum   = 1;
			carry = 0;
			end

	3'b101 : begin
			sum   = 0;
			carry = 1;
			end

	3'b110 : begin
			sum   = 0;
			carry = 1;
			end

	3'b111 : begin
			sum   = 1;
			carry = 1;
			end

	end

	endcase

endmodule
