module top();
	int da[$]={1,5,6,7};
initial
	begin

		foreach(da[i])
			begin
			$display(da.pop_front());
			$display("%p",da);

			end
	end



endmodule
