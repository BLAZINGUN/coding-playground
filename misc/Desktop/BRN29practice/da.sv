module top;

	int da1[],da2[];
initial
	begin
		da1=new[10];
		foreach(da1[i])
			da1[i]=i;
	
		$display("%p",da1);
		foreach(da1[i])
			$display(da1[i]);
		da1=new[30](da1);
		$display("%p",da1);
		da2=da1;
		$display("iam da2%p",da2);
		da1.delete();
		$display("%p",da1);

		
	end


endmodule
