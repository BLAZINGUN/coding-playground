`timescale 10ns/10ps

module full_subtractor_tb ;

reg a,b,c;
wire d, bo;

//change the module name while using the test bench.

full_subtractor_behavioral DUT(a,b,c,d,bo);

initial 
	begin
		a   = 1'b0;
		b   = 1'b0;
		c = 1'b0;
		#100 $finish;
	end


always 
begin
#40 a = ~a ;
#20 b = ~b ;
#10 c = ~c ;
end

always @ (a,b,c)

$monitor("AT TIME(in ns) = %t, a = %d ,b = %d, c = %d, difference = %d, borrow =%d", $time , a , b , c , d , bo );



endmodule