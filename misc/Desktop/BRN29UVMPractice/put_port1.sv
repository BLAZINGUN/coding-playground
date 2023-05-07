import uvm_pkg::*;
`include "uvm_macros.svh"

class producer extends uvm_component;
	`uvm_component_utils(producer)
	uvm_blocking_put_port#(int) put_port;
	function new(string name="producer",uvm_component parent);
		super.new(name,parent);
	endfunction	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		put_port=new("put_port",this);
		$display("build producer");
	endfunction
		

endclass
class consumer extends uvm_component;
	`uvm_component_utils(consumer)
	uvm_blocking_put_imp#(int,consumer) put_imp;
	
	function new(string name="consumer",uvm_component parent);
		super.new(name,parent);
	endfunction	
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		put_imp=new("put_imp",this);
		$display("build consumer");
	endfunction
	task put(output int data);
	endtask
endclass
class env extends uvm_component;
	`uvm_component_utils(env)
		producer p;
		consumer c;
	function new(string name="env",uvm_component parent);
		super.new(name,parent);
	endfunction
	virtual function void build_phase(uvm_phase phase);
			super.build_phase(phase);

	p=producer::type_id::create("p",this);
	c=consumer::type_id::create("c",this);
	endfunction
	virtual function void connect_phase(uvm_phase phase);
			super.connect_phase(phase);
		p.put_port.connect(c.put_imp);
	endfunction
	virtual function void end_of_elaboration_phase(uvm_phase phase);
			super.end_of_elaboration_phase(phase);
		uvm_top.print_topology();

	endfunction
	
endclass
module top;
	initial
		begin
			run_test("env");
		end
endmodule
		
