`timescale 10ns/10ps


module full_subtractor_behavioral_using_if_else (a,b,c,d,bo); 

input a,b,c; 

output d,bo; 

reg d,bo;


always @(a or b or c)
	
	begin

	if (a==0 && b==0 && c==0)
		
		begin
		d = 0;
		bo = 0;
		end

	else if (a==0 && b==0 && c ==1)
		
		begin
		d = 1;
		bo = 1;
		end 

	else if (a==0 && b==1 && c ==0)
		
		begin
		d = 1;
		bo = 1;
		end

	else if (a==0 && b==1 && c ==1)
		
		begin
		d = 0;
		bo = 1;
		end

	else if (a==1 && b==0 && c==0)
		
		begin
		d = 1;
		bo = 0;
		end

	else if (a==1 && b==0 && c ==1)
		
		begin
		d = 0;
		bo = 0;
		end

	else if (a==1 && b==1 && c ==0)
		
		begin
		d = 0;
		bo = 0;
		end

	else if (a==1 && b==1 && c ==1)
		
		begin
		d = 1;
		bo = 1;
		end

	end


endmodule