/*import uvm_pkg::*;
`include "uvm_macros.svh"
class trans extends uvm_sequence_item;
	rand int a;
	string s;
	`uvm_object_utils(trans);
	constraint c1{a>5;a<17;}
	virtual function void do_print(uvm_printer printer);
		printer.print_field("hi this is a",a,$bits(a),UVM_DEC);
		printer.print_string("s",s);

	endfunction
virtual function void do_copy(uvm_object rhs);
	trans t;

	super.do_copy(rhs);
	$cast(t,rhs);
	this.a=t.a;
	this.s=t.s;
endfunction
virtual function bit do_compare(uvm_object rhs,uvm_comparer comparer);
trans t;
	//super.do_compare(rhs,comparer);
$cast(t,rhs);
 //return super.do_compare(rhs,comparer) && this.a==t.a && this.s==t.s;
return comparer.compare_field_int("a",t.a,this.a,$size(a)) && comparer.compare_string("s",t.s,this.s);

endfunction
endclass
trans t1;
trans t2,t3;

	module top;
		initial
			begin
				t1=trans::type_id::create("t1");
				t2=trans::type_id::create("t2");
				
			t1.randomize();
			t1.s="uvm";
			t1.print();//it prints in a table
			t2.copy(t1);
			t2.print(uvm_default_table_printer);//it prints in a table
			$cast(t3,t1.clone());//t1--->return through the parent uvm_object
			t3.print(uvm_default_line_printer);//it prints in a line
			t3.s="maven";
			t1.print(uvm_default_table_printer);//it prints in a table
			$display("-----------");
			t3.print(uvm_default_table_printer);//it prints in a table
			if(t2.compare(t1))
				$display("both are same");
			else
				$display("both are not same");
				
			
		end
	endmodule */








import uvm_pkg::*;
`include "uvm_macros.svh"
class trans extends uvm_sequence_item;
	rand int a;
	string s;
	`uvm_object_utils(trans);

	constraint c1{a>5;a<17;}
	function new(string name="trans");
		super.new(name);
	endfunction
virtual function void do_print(uvm_printer printer);

	printer.print_field("a",a,32,UVM_HEX);
	printer.print_string("s",s);
endfunction
virtual function void do_copy(uvm_object rhs);
	trans t;
	$cast(t,rhs);
	this.a=t.a;
	this.s=t.s;

endfunction
virtual function bit do_compare(uvm_object rhs, uvm_comparer comparer);
trans t4;
$cast(t4,rhs);
	return this.a==t4.a && this.s==t4.s;//here "this" is t2 and t4-->rhs-->t1


endfunction 
endclass
trans t1,t2,t3;
	module top;
		initial
			begin
				t1=trans::type_id::create("t1");
				t2=trans::type_id::create("t2");
				
			t1.randomize();
			t1.s="uvm";
			t1.print(uvm_default_tree_printer);//it prints in a table
			t2.copy(t1);
			t2.print(uvm_default_line_printer);//it prints in a line
			$cast(t3,t1.clone());//t1--->return through the parent uvm_object
			t3.print(uvm_default_line_printer);//it prints in a table
			t3.s="maven";
			t1.print(uvm_default_table_printer);//it prints in a table
			$display("-----------");
			t3.print(uvm_default_tree_printer);//it prints in a table
			t2.s="silicon";
			if(t2.compare(t1))
				$display("both are same");
			else
				$display("both are not same");
				
			
		end
	endmodule 
