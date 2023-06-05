`timescale 10ns/10ps

module half_adder_behavioral_using_if_else (a,b,sum,carry); 

input a,b; 

output sum, carry; 

reg sum ,carry;


always @(a or b)
	
	begin

	if (a==0 && b==0)
		
		begin
		sum = 0;
		carry = 0;
		end

	else if (a==0 && b==1)
		
		begin
		sum = 1;
		carry = 0;
		end 

	else if (a==1 && b==0)
		
		begin
		sum = 1;
		carry = 0;
		end

	else if (a==1 && b==1)
		
		begin
		sum = 0;
		carry = 1;
		end

	end


endmodule
