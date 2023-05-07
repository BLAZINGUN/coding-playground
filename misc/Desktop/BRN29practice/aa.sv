module top;

	int amem[int];
	int amem2[string];
	int amem3[*];
initial
	begin

		amem[23]=25;
		amem[78]=34;
		$display("%p",amem);
		amem2["one"]=1;
		amem2["two"]=2;
		$display("%p",amem2);
		//amem3[]=20;
		amem3["three"]=3;
		$display("%p",amem3);
		if(amem.exists(27))
			$display("The value is %d",amem[23]);
	end




endmodule
