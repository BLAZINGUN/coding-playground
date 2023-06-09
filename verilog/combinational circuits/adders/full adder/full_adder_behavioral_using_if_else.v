`timescale 10ns/10ps

module full_adder_behavioral_using_if_else (a,b,cin,sum,carry); 

input a,b,cin; 

output sum, carry; 

reg sum ,carry;


always @(a or b)
	
	begin

	if (a==0 && b==0 && cin ==0)
		
		begin
		sum = 0;
		carry = 0;
		end

	else if (a==0 && b==0 && cin ==1)
		
		begin
		sum   = 1;
		carry = 0;
		end 

	else if (a==0 && b==1 && cin ==0)
		
		begin
		sum   = 1;
		carry = 0;
		end

	else if (a==0 && b==1 && cin ==1)
		
		begin
		sum   = 0;
		carry = 1;
		end

	else if (a==1 && b==0 && cin ==0)
		
		begin
		sum   = 1;
		carry = 0;
		end

	else if (a==1 && b==0 && cin ==1)
		
		begin
		sum   = 0;
		carry = 1;
		end

	else if (a==1 && b==1 && cin ==0)
		
		begin
		sum   = 0;
		carry = 1;
		end

	else if (a==1 && b==1 && cin ==1)
		
		begin
		sum   = 1;
		carry = 1;
		end

	end


endmodule