module top;
	class trans;
		const  int i;
			function new(int r);
				i=r;
			endfunction
			function void disp(int d);
				i=d;
			endfunction
	endclass

trans t1,t2;
	initial
		begin

			t1=new(89);
			t2= new(32);
			t2.disp(45);
			$display(t1.i);
			$display(t2.i);
			
			
		
		end
endmodule
