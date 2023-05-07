module top;

	class transaction;
		int i;//base i
		function new (int pay);
			i=pay;
		endfunction
	endclass
	class extend_trans extends transaction;
		super.new(i);
		int i;//child i
		function new(int f);
			i=f;
		endfunction 
	endclass
	transaction th1;
	extend_trans eth1;
initial
	begin
		//th1=new;

		eth1=new(5);
		//th1.i=12;
		//eth1.i=13;
		//eth1.updat;
		$display("%p",th1);
		$display("%p",eth1);
	end
endmodule
