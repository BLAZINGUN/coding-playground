class parent_trans;
	local logic[1:0]a;
	protected logic[1:0]b;
	protected function void display();
		$display("a=%d,b=%d",a,b);
	endfunction

	function void update(logic[1:0] a,b);
		this.a=a;
		this.b=b;

	endfunction
endclass

class child_trans extends parent_trans;

	logic[1:0] c;
function void calc();
	super.display();
	//super.a=2;
	super.b=1;

endfunction 

endclass

module test();

	initial 
		begin 
			parent_trans par_h;
			child_trans c_h;
			par_h =new();
			//par_h.a=2;
			//par_h.b=2;

			par_h.update(1,2);

			c_h=new();
			c_h.update(2,3);
		//	c_h.display();
			c_h.calc();
		end
endmodule
			






