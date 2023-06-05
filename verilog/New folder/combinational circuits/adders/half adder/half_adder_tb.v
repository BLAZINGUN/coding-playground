`timescale 10ns/10ps

module half_adder_tb ;

reg a,b;
wire sum , carry;


half_adder_dataflow1 DUT(a,b,sum,carry);

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

$monitor("AT TIME(in ns) = %t, a = %d ,b = %d, sum = %d, carry =%d", $time , a , b , sum , carry );



endmodule
