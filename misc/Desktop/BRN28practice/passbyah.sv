module top;

	class transaction;
		int data;
	endclass

	class packet;

		function automatic  create( ref transaction tc);
			tc=new;
			tc.data=23;
		endfunction

	endclass

packet p_h;
transaction t_h;
		initial 

			begin
				p_h=new;//creation of object for packet class
				p_h.create(t_h);
			$display(t_h.data);
			end

endmodule
///Method Overriding 

/*module top;

	class base;

		 virtual function void disp();
			$display("Iam in base");
		endfunction 
	
	endclass

	class derived1 extends base;

			 function void disp();
				$display("Iam in derived");
			endfunction 

	endclass


derived1 d_h1,d_h2;//derived class handle
base b_h;///Base class handle
		initial

			begin

			d_h1=new;
		//	b_h=d_h1;//legal
				$cast(b_h,d_h1);
		//	$cast(b_h,d_h1)
			b_h.disp();
			//d_h2=b_h;//illegal
		//	$cast(d_h2,b_h);//legal
		//	d_h2.disp();

			end

endmodule*/
