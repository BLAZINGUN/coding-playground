class trans;
	int i;
	function new(int i=10);
		i=i;
		$display("Hi iam called");
		$display(this);
	endfunction

endclass

class ex_trans1 extends trans;
	int i;
		function new(int i);
			//super.new(i);
				//$display(this);
			i=20;
		endfunction
endclass

ex_trans1 e_h;

module top;

	initial 
		begin
			e_h=new(10);
			$display("%p",e_h);
		end
endmodule 
