module top;

	class transaction;

		static int i;
			int j;
		 static function void stat_fun();
			  int b;
				i++;
				b++;
			
				$display("The value of i is%d value of b is %d",i,b);//

		endfunction

	endclass
transaction t1,t2;
	initial
		begin
		t1=new();
		t1.stat_fun();// 1 1
		t1.stat_fun();//2 1
		t1.stat_fun();//3 1
		t2.stat_fun();//4 1

		end
endmodule
/*module top;

	class transaction;

		static int i;
			int j;
		 function   void stat_fun();
			  int b;
				i++;
				b++;
				j=j+1;;//non static can be accesed ,j works like a static only for that particular object
			
	$display("The value of i is%d value of b is %d value if j is%d",i,b,j);//

		endfunction

	endclass
transaction t1,t2,t3;
	initial
		begin
		t1=new();
		t2 =new();
		t1.stat_fun();//1 1 1 //1 1 1
		t1.stat_fun();//2 2 2//2 1 2
		t1.stat_fun();//3 3 3// 3 1 3
		t2.stat_fun();//4 4 1// 4 1 1
		t2.stat_fun();//4 4 1// 4 1 1

		end
endmodule*/
