`timescale 10ns/10ps

module half_subtractor(a,b,d,bo);
input a,b;
output d,bo;


reg d ,bo;


always @(a or b)
	
	begin

	if (a==0 && b==0)
		
		begin
		d = 0;
		bo = 0;
		end

	else if (a==0 && b==1)
		
		begin
		d = 1;
		bo = 1;
		end 

	else if (a==1 && b==0)
		
		begin
		d = 1;
		bo = 0;
		end

	else if (a==1 && b==1)
		
		begin
		d = 0;
		bo = 0;
		end

	end

endmodule