/*module top;
	function void disp();
		$display("Iam in disp");
	endfunction

initial
	begin
		disp();

	end
endmodule*/
/*module top;
int k;
	function int disp();
			return 2;//
		$display("Iam in disp");
	endfunction

initial
	begin
	k=disp();
		$display("The value of k is %d",k);

	end
endmodule*/
module top;
	task automatic double(int a, string s);
		#5;
		a=a*2;
	$display($time,"s=%s a=%d",s,a);

	endtask
initial
	fork
		begin
			double(5,"th1");
		end
		begin
			#2;
			double(4,"th2");
		end

	join




endmodule
