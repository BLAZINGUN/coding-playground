module top;

	virtual class packet;
		int a;
		pure virtual function void disp();//declaration
			function void disp2();
			$display("I acn have definition in virtual class but I can accesible only by extended class");


			endfunction
	endclass
	
	class ext extends packet;

		 function void disp();
			$display("Iam implemnting the function disp the value of a is %0d",a);
		endfunction
	endclass
ext ex1;

	initial

		begin
			ex1=new;
			ex1.a=13;
			ex1.disp();
			ex1.disp2();

		end


endmodule
