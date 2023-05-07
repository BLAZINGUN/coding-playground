import uvm_pkg::*;//class difinitions
`include "uvm_macros.svh"//macro definitions

class mycomponent extends uvm_component;//relavant parent class
	`uvm_component_utils(mycomponent)//factory registration
	function new(string name="mycomponent",uvm_component parent);//new function 
		super.new(name,parent);
	endfunction
endclass//1 to 9 
class mycomponent1 extends uvm_component;//relavant parent class
	`uvm_component_utils(mycomponent1)//factory registration
	function new(string name="mycomponent1",uvm_component parent);//new function 
		super.new(name,parent);
	endfunction
endclass//1 to 9 
class mydriver extends uvm_driver;//relavant parent class
	`uvm_component_utils(mydriver)//factory registration
	function new(string name="mydriver",uvm_component parent);//new function 
		super.new(name,parent);
	endfunction
endclass//1 to 9 
class trans extends uvm_object;//relavant parent class
	`uvm_object_utils(trans)//factory registration
	function new(string name="trans");//new function 
		super.new(name);
	endfunction
endclass//1 to 9 
class myseq extends uvm_sequence_item;//relavant parent class
	`uvm_object_utils(myseq)//factory registration
	function new(string name="myseq");//new function 
		super.new(name);
	endfunction
endclass//1 to 9 

	module top;
		initial
			begin
				factory.print();//classes registered to the factory

			end
	endmodule	


