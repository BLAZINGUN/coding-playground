`timescale 10ns/10ps

module half_subtractor_tb ;

reg a,b;
wire d,bo;


half_subtractor_dataflow DUT(a,b,d,bo);

initial 
	begin
		a=1'b0;
		b=1'b0;
		#100 $finish;
	end


always 
begin
#20 a = ~a ;
#10 b = ~b ;
end

always @ (a,b)

$monitor("AT TIME(in ns) = %t, a = %d ,b = %d, d = %d, bo =%d", $time , a , b , d , bo );



endmodule
