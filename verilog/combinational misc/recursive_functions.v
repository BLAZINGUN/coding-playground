//sum of squares of first n natural numbers


module recursive_functions(n,sum);

input n = 3;
output sum;


function automatic integer sum_sq;

input n;

begin
	
	if (n ==1 )
		sum_sq = 1;
	else begin
		sum_sq  = sum_sq + (n*n);
	end

end



initial
	begin

		sum = sum_sq(3);

	end



endmodule