
interface intr;
logic a;
logic b;
logic sum;
logic cout;
endinterface


module ha(intr it);

assign {it.cout,it.sum}=it.a+it.b;
endmodule



module hasvtb;
intr it();
ha DUT(it);
initial 

begin
it.a=0;
it.b=0;
#10
it.a=0;
it.b=1;

#10
it.a=1;
it.b=0;
#10
it.a=1;
it.b=1;
end
initial
$monitor(it.a,it.b,it.sum,it.cout);
initial
#500 $finish;
endmodule
