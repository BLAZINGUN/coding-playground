//Arguments passing by Name
/*module top;
integer val;

	 task  read(integer j=0,k,data=1);
		#10;
		$display(j,k,data);
		
	endtask
	
initial 
	begin
		val=4;
		
		read(.j(4),.k(val),.data(7));
		read(.k(val));
		read(.k(val),.data(7),.j(5));



	end



endmodule*/
//Arguments passing by Ref
/*module top;
int d;
	function automatic void cal(ref int a);
		a=a*2;
		$display("The value of a is %d",a);
	endfunction
initial
	begin
		d=2;

		cal(d);
		$display("The value of d is %d",d);
	end

endmodule*/
//Deep dopy
module top;

	class trans ;
	
		int data;
		function trans copy();
			copy =new;
			copy.data=this.data;
			$display(this);
		endfunction
	endclass		
trans th1,th2;

initial 
	begin
		th1=new;
		th1.data=4;
		$display(th1);
		th2 =th1.copy;
	end


endmodule



