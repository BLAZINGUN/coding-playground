/*module top;
	class transaction;

		static int i;
		int j;
		static function void stat_fun();
			int b;
			i++;
			b++;
		$display("i=%0d,b=%0d",i,b);	
		endfunction
	endclass
	//transaction t_h1,t_h2;
	initial
		begin
	//	t_h1=new;
	//	t_h2=new;
		transaction::stat_fun();//i=1,b=1
		transaction::stat_fun();//i=2,b=1
		transaction::stat_fun();//i=3,b=1
		t_h1.stat_fun();//i=2 b=1
		t_h1.stat_fun();//i=3 b=1
		end	

endmodule*/
/*module top;
	class transaction;

		static int i;
		int j;
		 function static  void fun_stat();
			int b;
			j++;
			b++;
			i++;
		$display("j=%0d,i=%0d,b=%0d",j,i,b);	
		endfunction
	endclass
	transaction t_h1,t_h2;
	initial
		begin
		t_h1=new;
		t_h2=new;
		t_h1.fun_stat();//j=1 i=1 b=1
		t_h1.fun_stat();//j=2 i=2 b=2
		t_h1.fun_stat();//j=3 i=3 b=3
		$display("/////////////////");
		t_h2.fun_stat();//j=1 i=4 b=4
		t_h2.fun_stat();//j=2 i=5 b=5
		t_h2.fun_stat();//j=3 i=6 b=6
		end	

endmodule*/
/*module top;

	function void  createit(transaction trans_h);
		trans_h=new;
		trans_h.data=25;		
	endfunction

	class transaction;
		int data;
	endclass
	transaction t_h;
	initial 
		begin
			createit(t_h);
			$display("%d",t_h);
	end
endmodule*/

module top;
	class parent;

		function void create( ref T trans_h);
			trans_h=new;
			trans_h.data=25;		
		endfunction
	endclass
	class T;
		int data;
	endclass
	T t_h;
	parent p;
	initial 
		begin
	p=new;
	p.create(t_h);
	$display("%d",t_h.data);
	end
endmodule
/*
module top;
	class packet;
		int a;
	endclass

	class smallpacket extends packet;
	int a;
	endclass
	smallpacket sp1;
	initial
		begin
			sp1= new;
			sp1.a=23;
			$display("%p",sp1);

		end
endmodule*/
		

