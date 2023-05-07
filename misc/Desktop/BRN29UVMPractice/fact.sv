import uvm_pkg::*;
`include "uvm_macros.svh"
class mycomponent extends uvm_component;
	`uvm_component_utils(mycomponent)
	function  new(string name="mycomponet",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
class mycomponent2 extends uvm_component;
	`uvm_component_utils(mycomponent2)
	function  new(string name="mycomponet2",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
module top;
	initial
		begin
		$display("The number is %d",factory);
		factory.print();
		end










endmodule
