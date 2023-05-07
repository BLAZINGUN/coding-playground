//Local
/*module top;
	class packet;
		 local int a;
		function new(int b);
			a=b;
		endfunction
		function void disp();
			$display("The value of a is %d",a);
		endfunction

	endclass

packet pc;
	initial

		begin

			pc=new(12);
			//pc.a=12;
			pc.disp;
		end
endmodule*/
		
//Protected

module top;
	class packet;
		   protected int a;
			protected  int v;
			function new(int c);
			a=c;
			endfunction 
		function void disp();
			$display("The value of a is %d",a);
		endfunction

	endclass
class ext extends packet;
int b;
	function new(int c);
	super.new(c);
	super.v=5;// we can access the protectded which their in parent class
	
	
	
	endfunction
		
endclass

ext e1;
	initial

		begin
			e1=new(5);
			e1.disp();
		
		end
endmodule










