`timescale 10ns/10ps

module full_adder_tb ;

reg a,b,cin;
wire sum , carry;

//change the module name while using the test bench.

full_adder_behavioral DUT(a,b,cin,sum,carry);

initial 
	begin
		a   = 1'b0;
		b   = 1'b0;
		cin = 1'b0;
		#1000 $finish;
	end


always 
begin
#40 a = ~a ;
#20 b = ~b ;
#10 cin = ~cin ;
end

always @ (a,b,cin)

$monitor("AT TIME(in ns) = %t, a = %d ,b = %d, cin = %d, sum = %d, carry =%d", $time , a , b , cin , sum , carry );



endmodule
