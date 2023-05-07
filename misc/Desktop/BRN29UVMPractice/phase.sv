import uvm_pkg::*;
`include "uvm_macros.svh"
class agent extends uvm_agent;
	`uvm_component_utils(agent)
	function new(string name="agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		int data=28;
		super.build_phase(phase);
		`uvm_info("build",$sformatf("The value of data is %0d",data),UVM_LOW)
		
 
		`uvm_info("build","Iam in build phase of agent",UVM_LOW)
		`uvm_info("build","Iam in build phase 2 ",UVM_LOW)
		`uvm_info("build","Iam in build phase 3",UVM_LOW)
		`uvm_info("build","Iam in build phase 4",UVM_LOW)
		`uvm_info("agent","Iam in build phase 4",UVM_LOW)
			$display("%d",this);
		
		
			
	endfunction
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		$display("Iam in connect phase of agent");
	endfunction
	virtual function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		$display("Iam in agent elaboration");
	endfunction
		task run_phase(uvm_phase phase);
			super.run_phase(phase);
			phase.raise_objection(this);
			$display("Iam in run phase of agent");
			phase.drop_objection(this);
		endtask
		
endclass
class env extends uvm_env;
	`uvm_component_utils(env)
		agent agt;
	function new(string name="env",uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual	 function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("env","Iam in build phase of env",UVM_MEDIUM)
		agt=agent::type_id::create("agt",this);
			$display("%d",this);
		//agt.set_report_id_verbosity("build",UVM_NONE);
		//agt.set_report_verbosity_level(UVM_NONE);
	endfunction
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		$display("Iam in connect phase of env");
	endfunction
		task run_phase(uvm_phase phase);
			super.run_phase(phase);
			phase.raise_objection(this);
			$display("Iam in run phase of env");
			phase.drop_objection(this);
		endtask
endclass
class test extends uvm_test;
	`uvm_component_utils(test)
		env ev;
	function new(string name="test",uvm_component parent);
		super.new(name,parent);
	endfunction

	virtual function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		`uvm_info("test","Iam in build phase of test",UVM_MEDIUM)
			$display("%d",this);
			$display("%d",this.ev.agt);
		ev=env::type_id::create("ev",this);
			$display("%d",this.ev);
	endfunction
	virtual function void connect_phase(uvm_phase phase);
		super.connect_phase(phase);
		$display("Iam in connect phase of test");
	endfunction
	virtual function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		$display("Iam in test elboration");
		uvm_top.print_topology();
	endfunction
	
		task run_phase(uvm_phase phase);
			super.run_phase(phase);
			phase.raise_objection(this);
			#100;
			$display("Iam in run phase of test");
			phase.drop_objection(this);
		endtask
endclass

module top;
		initial

			begin
			$display("default verbosity is %d",uvm_top.get_report_verbosity_level);
		//	uvm_top.set_report_verbosity_level(UVM_LOW);
			$display("changed default verbosity is %d",uvm_top.get_report_verbosity_level);

			run_test("test");//It ceratethe instance of test class and calls buldphase

			end
endmodule

