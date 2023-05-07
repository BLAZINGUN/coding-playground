/*module top;

class A;

int a ;

endclass
A a1,a2,a3;

initial
begin
a1=new;
a2=new;
a3=new;
$display("%d",a1);
$display("%d",a2);
$display("%d",a3);
a2=a1;

$display("%d",a2);
$display("%d",a1);
a1=a3;
$display("%d",a1);
$display("%d",a2);
$display("%d",a3);
end


endmodule*/

module top;

class A;

	function void disp();
	$display(this);
	endfunction
endclass

	A a1,a2;

initial
	begin
	a1=new;
	a2=new;
	$display(a1);
	$display(a2);
	a1.disp();
	a2.disp();	

end
		





endmodule
