/*module top;

	class vector#(int size=1, p=4);

		bit [size-1:0] a;
		function void disp();
			$display("The value of a is %0d",a);
			$display("The size is %0d",size);
			$display("The size is %0d",p);

		endfunction
	endclass
vector #(.size(16),.p(7)) v1;


		initial

			begin
				v1=new;
				v1.a=185;
				v1.disp();

			end


endmodule*/
module top;
	class vector#(type T=int);
		T a;
		function void disp();
			$display("The value of a is %d",a);
		endfunction
	endclass
	class ext#(type p=int) extends vector;
		p b;
		function void write();
			$display("The value of b is %d",b);
			

		endfunction

	endclass
ext #(int) ex1;
		initial

			begin
				ex1=new;
				ex1.a=24;
				ex1.b=1456;
				ex1.disp();
				ex1.write();
			end
					
		

endmodule
