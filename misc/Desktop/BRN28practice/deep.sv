//sub class


/*module top();
	class sub;
		int a;
	endclass

	class base;
		int b;
		sub sbh =new;//sub class
	endclass
	
	base bh1 ,bh2;

	initial
		begin
		
			bh1 = new;
			bh1.b=56;
			$display("The value b in base is %d",bh1.b); 
			bh1.sbh.a=47;
			$display("The value a in sub  is %d",bh1.sbh.a);
			bh2=new bh1;
	
			bh2.sbh.a=53;
			$display("The value a in sub  is %d",bh1.sbh.a);
			$display("%d",bh1.sbh);
			$display("%d",bh2.sbh);
			bh1.b=34;
			$display("%d",bh2.b);	

		end
endmodule*/

//Deep copy

module top();
int y;

	function int sum(int a);
		int p;
		p=a+1;
		return p;

	endfunction

initial
	begin
	y=sum(6);
	$display("The value of y is %d",y);//7
	end
endmodule


/*module top();
	class sub;
		int obj;
		function sub copysub();
			copysub=new;
			copysub.obj=this.obj;

		endfunction
	
	endclass
	class trans;
		int data;
		sub sub_h =new;
		function trans copyit();
			copyit=new;
			copyit.data=this.data;
			copyit.sub_h=this.sub_h.copysub;

		endfunction 
	endclass
	
trans t_h1,t_h2;

initial 
	begin
	t_h1=new;
	t_h1.data=4;
	t_h1.sub_h.obj=5;
	t_h2 =t_h1.copyit;
	t_h2.sub_h.obj=7;
	$display("t_h1.sub_h.obj=%0d",t_h1.sub_h.obj);

	//shallow copy
	/*$display("t_h1.data=%0d",t_h1.data);
	$display("t_h1.sub_h.obj=%0d",t_h1.sub_h.obj);
	t_h2= new t_h1;
	t_h2.sub_h.obj=7;
	$display("t_h1.sub_h.obj=%0d",t_h1.sub_h.obj);*/

	//Deep copy
	//end


//endmodule

module top();
	class base;
		int a;
		int b;
		function base copyit();
		copyit = new;
		copyit.a = this.a;
		copyit.b = this.b;
		endfunction
	endclass
base b1,b2;

initial 
	begin
		b1=new;
		b1.a=15;
		b1.b=17;
		//b2=new b1;
		b2=b1.copyit();
		$display("%p",b2);
		

		
	end
	
endmodule
	








