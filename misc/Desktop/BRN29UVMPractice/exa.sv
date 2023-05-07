/*class parent;
	string name;
	int n;
	function new(string name, int n);
			this.name=name;
			this.n=n;
		$display("%s,%d",name,n);
	endfunction
endclass*/
class child extends parent;
	function new(string me,int p);
		super.new(me,p);	

	endfunction

endclass//10 to 16 lines 

//parent p;
/*child ch;

	module 	top;
		initial
			begin

			ch=new("uvm",1);
			end
	endmodule*/

uvm_component

	function new(string name,uvm_component parent);


	endfunction

