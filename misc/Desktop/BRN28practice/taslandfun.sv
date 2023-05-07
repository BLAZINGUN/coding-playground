///void
/*module top;
int a=5,b=7;
int sum,double;
function int summation(input[3:0] x,input[3:0]y,output[5:0] z);
	summation =x+y;//12
	z=2*summation;//24
	return x+y;
endfunction
task write();
	$display("sum is %0d and the doubled value is %0d",sum,double);
endtask
initial
	begin
		sum =summation(a,b,double);
		write();
	end

endmodule*/

/*module top;
int p;
function int take(input int a);
	if(a==0)
		return 1;
		$display("Iam not zero");
endfunction
task int  write();
return 2;
endtask
initial
	begin
		p=take(0);
		$display("%d",p);
			$display(write);
	end

endmodule*/

/*module top;
int y;
task  write(input int x,output int z);
z=x*2;
//return;
$display("Iam in write");
endtask
initial
	begin
	write(2,y);
$display("the value of y is %d",y);
	end
endmodule*/
/*module top;
int y;
	task read(output int z,input integer j=0,k,data=1);
	$display("The value of j is %0d ,kis %0d,datais %0d",j,k,data);
	z=123;
	endtask

initial
	begin
	read(y,.data(3),.j(9),.k(4));
	$display(y);
	end

endmodule*/
/*module top;
int y;
task automatic  write(ref int k);//k=y->k=2
	k++;
	$display("The value of k is %0d",k);
endtask
initial

begin
	write();
	$display("The value of y is%d",y);
end*/

//endmodule
module top;
	task automatic double(int a,string s);//
		#5;
		a=a*2;
		$display($time,"s=%s,a=%d",s,a);
	endtask
initial 

		fork
			begin 
			double(5,"from thread1");//1st
			end

			begin
			#2;	
			double(4,"from thread2");//2nd
			end
		join

endmodule
//5 from thread 1,10

//7 from thread 2,8











