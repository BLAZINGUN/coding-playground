`timescale 10ns/10ps

module magnitude_comparator(a,b,eq,lt,gt);

input [3:0] a, b ;

output eq,lt,gt;

reg eq,lt,gt;



always @ (a,b)

begin

	if (a==b)
		begin
			eq=1;
			lt=0;
			gt=0;
		end

	else if (a>b)
		begin
			eq=0;
			lt=0;
			gt=1;
		end

	else 
		begin
			eq=0;
			lt=1;
			gt=0;
		end

end

endmodule