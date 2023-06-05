`timescale 10ns/10ps

module half_adder_behavioral_using_case (a,b,sum,carry); 

input a,b; 

output sum, carry; 

reg sum ,carry;


always @(a or b) 

	begin

	case({ab} )

	2'b00 : begin
			sum   = 0;
			carry = 0;
			end

	2'b01 : begin
			sum   = 1;
			carry = 0;
			end

	2'b10 : begin
			sum   = 1;
			carry = 0;
			end

	2'b11 : begin
			sum   = 0;
			carry = 1;
			end

	end

	endcase

endmodule
