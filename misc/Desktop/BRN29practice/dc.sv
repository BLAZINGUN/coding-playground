module top;
	class base;
		int a;
	endclass
	class derived extends base;

		int b;

	endclass
base b;
derived d1,d2;
	initial
		begin
		b= new;
		b.a=12;
		d1=new;
		d1.b=17;
		
	//b=d1;//legal
		$cast(b,d1);
		//d2=b;//illegal
		$cast(d2,b);//legal

		

		end
endmodule
