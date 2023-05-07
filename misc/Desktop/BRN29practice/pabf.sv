module top;
	class transaction;
		int data;
	endclass
	class pass;
		function transaction creat(ref transaction trans_h);
			trans_h =new;
			trans_h.data=24;

		endfunction

	endclass
	pass p1;
	transaction t1;

	initial

		begin
		p1=new;
		p1.creat(t1);
		$display(t1.data);

		end


endmodule
