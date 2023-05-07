import uvm_pkg::*;
`include "uvm_macros.svh";

class trans extends uvm_sequence_item;//transaction level 
	`uvm_object_utils(trans)
	function new(string name="trans");
		super.new(name);
	endfunction
	rand int a;//rand int a variabloe
	constraint c1{a>5;a<17;}//
endclass
class extrans extends trans;
	`uvm_object_utils(extrans)
	function new(string name="extrans");
		super.new(name);
	endfunction
	constraint c1{a==20;}
endclass
trans t;
module top;
	initial
		begin
			factory.print();// uvm_factory factory=new;; 
			factory.set_type_override_by_type(trans::get_type(),extrans::get_type());
			t=trans::type_id::create("t");//creating the object
			factory.print();
			repeat(5)
			begin
				t.randomize();//randomizing 
				$display("%d",t.a);//printing
			end
		end
endmodule

	
	
