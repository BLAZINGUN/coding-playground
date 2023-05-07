//Local Access Specifier

/*module top;
	class Base;
		 local int a;
		function new(int a);
		this.a =a;
		endfunction
		function void disp();
			$display(a);

		endfunction
	endclass
	class derived extends Base;

		function new(int a);
			super.a=a;

		endfunction
			function dis(int a);

			super.a =a;
			endfunction

	endclass

	Base b_h;
	derived d_h;
		initial
			begin
				//b_h=new(12);
				//b_h.disp();
				d_h =new;
				d_h=dis(3);
			//	d_h.a=13;
			d_h.disp();
					
			end

endmodule*/


module top;

		class base;
		
			protected int a;

		endclass
		class derived extends base;
				int a;

			function void dis(int a);

				super.a=a;// We can acees the member from Base because it is declared as protected
				
			endfunction
			function void disp();
				$display(a);
			endfunction
		endclass

base b_h;
derived d_h;

		initial
			begin
				d_h=new;
				d_h.dis(5);
				d_h.disp();	
	
			end

endmodule
