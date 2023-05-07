module Ha(input a, input b,output sum,output cout);

assign {cout,sum}=a+b;

endmodule

module Hatb();
reg a;
reg b;
wire sum;
wire cout;
Ha DUT(.a(a),.b(b),.sum(sum),.cout(cout));
initial 
	begin
		a=0;
		b=0;
	#10 	
		a=0;
		b=1;

	#10 	
		a=1;
		b=0;

	#10 	
		a=1;
		b=1;
	end
initial 
$monitor(a,b,sum,cout);
initial
begin
#500 $finish;
end
endmodule
