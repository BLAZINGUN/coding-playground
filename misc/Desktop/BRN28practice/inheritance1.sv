/*module top;
	class Base;
		int a;
		int b;

		function void display();
			$display("Iam in base");
		endfunction
	endclass 
	class derived1 extends Base;
		int c;
		function void print();
			$display("Iam in derived1");
		endfunction
	endclass
	
	Base b1;
	derived1 d1;
initial
	begin
		b1=new;
		d1=new;
		b1.a=23;
		b1.b=33;
		d1.a=43;
		d1.b=53;
		d1.c=63;
		b1.display();
		d1.display();
		d1.print();
		$display("%p",b1);
		$display("%p",d1);
	end
endmodule*/

module top;

	class Base;
		int a;

		function void disp();

			$display(a);

		endfunction

	endclass

	class derived1 extends Base;

		int a;
		
		function void write();
			super.a=23;

			$display(super.a);

		endfunction



	endclass

	Base b1;
	derived1 d1;

initial
	begin
		b1=new;
		d1=new;
		//b1.a=33;
		d1.a=43;
		b1.disp();
		d1.write();
		
	end


endmodule
