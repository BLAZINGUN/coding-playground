import uvm_pkg::*;
`include "uvm_macros.svh"
class sequencer extends uvm_sequencer;
	`uvm_component_utils(sequencer)
	function new(string name="sequencer",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
class driver extends uvm_driver;
	`uvm_component_utils(driver)
	function new(string name="driver",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
class monitor extends uvm_monitor;
	`uvm_component_utils(monitor)
	function new(string name="monitor",uvm_component parent);
		super.new(name,parent);
	endfunction
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	endfunction
endclass
class agent extends uvm_agent;
	`uvm_component_utils(agent)
	function new(string name="agent",uvm_component parent);
		super.new(name,parent);
	endfunction
	driver d;
	monitor m;
	sequencer s;	
	uvm_active_passive_enum is_active;
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
	m=monitor::type_id::create("m",this);
	uvm_config_db#(uvm_active_passive_enum)::get(this,"","enum",is_active);


	if(is_active==UVM_ACTIVE)
		begin
			d=driver::type_id::create("d",this);
			s=sequencer::type_id::create("s",this);
		end
		

	endfunction
endclass
class agt_top extends uvm_env;
	`uvm_component_utils(agt_top)
	int n;
	agent ag[];
	function new(string name="agt_top",uvm_component parent);
		super.new(name,parent);
	endfunction
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		uvm_config_db#(int)::get(this,"","noofagents",n);
		ag= new[n];
		foreach(ag[i])
			ag[i]=agent::type_id::create($sformatf("ag[%0d]",i),this);
		$display("The nof of agnets are %d",n);
	endfunction
endclass
class env extends uvm_env;
	`uvm_component_utils(env)
	agt_top agtp;
	function new(string name="env",uvm_component parent);
		super.new(name,parent);
	endfunction
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		agtp=agt_top::type_id::create("agtp",this);
	endfunction
endclass
class test extends uvm_test;
	`uvm_component_utils(test)
	env ev;
	int no_of_agents=4;
	uvm_active_passive_enum is_active=UVM_ACTIVE;
		function new(string name="test",uvm_component parent);
			super.new(name,parent);
		endfunction
	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		ev=env::type_id::create("ev",this);
		uvm_config_db#(int)::set(this,"ev.agtp","noofagents",no_of_agents);
		for(int i=2;i<=3;i++)
		uvm_config_db#(uvm_active_passive_enum)::set(this,$sformatf("*.ag[%0d]*",i),"enum",is_active);
	endfunction
	virtual function void end_of_elaboration_phase(uvm_phase phase);
			super.end_of_elaboration_phase(phase);
		uvm_top.print_topology;
	
	endfunction
	
endclass
module top;

	initial
		begin

			run_test("test");
		end
endmodule

		
	
		


