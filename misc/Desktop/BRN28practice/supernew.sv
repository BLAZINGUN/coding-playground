//Super new
/*module top;
	class account_c;
		int a=45;
		//function new(int c);
		//	a=c;
	//	endfunction
	endclass
	class linked_account extends account_c;
		int a;
		
		function new(int c);
		//	super.new(c);
		super.a =c;
		endfunction

	endclass
linked_account lin_h;
account_c acc;

	initial
		begin
		acc= new;
		lin_h =new(20);
	//	lin_h.b=12;
		$display(lin_h.a);
		$display(acc.a);
		end
endmodule*/

//Chaining constructor
/*module top;
	class account_c;
		int a;
		function new(int c);
			a=c;
		endfunction//
	endclass
	class linked_account extends account_c(20);
		int b;
		
		function new(int c);
			super.new(c);
		endfunction

	endclass
linked_account lin_h;

	initial
		begin
		lin_h =new();
		$display(lin_h.a);
		end
endmodule*/
//static properties
/*module top;
	class packet;
		static int a=45;
	endclass

packet p_h1,p_h2;

	initial 
		begin
		//p_h1=new;
		//p_h2=new;
		p_h1.a=13;
	//	p_h2.a=34;
		$display(packet::a);//Scope resolution
		//$display(p_h2.a);
		end

endmodule*/
//Global Constant Properties

module top;
	class circle;
		const real pi=3.14;

		function void area(int r);
			$display(pi*r*r);
		endfunction
	endclass
circle c1;
	initial 
		begin
			c1=new;
		//	c1.pi=2;
			c1.area(5);
		end

endmodule






