package pkg;

	int no_of_trans;
	function void write(string s);
	$display($time,"%s,n=%0d",s,no_of_trans);
	endfunction

endpackage
module A;
import pkg::no_of_trans;//* indicates importing all
	initial
		begin
			#1;
			no_of_trans=10;
			//#7;
		//	write("from module A");
		end

endmodule :A
module B;
import pkg::write;
		
	initial
		begin
		#1;
		//no_of_trans=20;
		write("from module B");
		end	

endmodule :B


