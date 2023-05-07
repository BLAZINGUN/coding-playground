//Interface Definition
interface intr;
logic a;
logic b;
logic sum;
logic cout;
endinterface 
//DUT definition
module ha(intr itf);//instantiating interface
assign {itf.cout,itf.sum}=itf.a+itf.b;
endmodule

//Test Bench
module hasvtb();
intr itf();
ha DUT(itf);
initial 
	begin
		itf.a=0;
		itf.b=0;
		#10
		itf.a=0;
		itf.b=1;
		#10
		itf.a=1;
		itf.b=0;
		#10
		itf.a=1;
		itf.b=1;
	end
initial 
	$monitor(itf.a,itf.b,itf.sum,itf.cout);
initial
	begin
	#500
	$finish;
end
endmodule
	









