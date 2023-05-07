
`timescale 10ns/1ns

interface dff_if(input clk);
	logic d,rst,sel,q;
	parameter thold=2,tsetup=4;
	clocking cb@(posedge clk);

		default input#(tsetup) output#(thold);

		output d;
		output rst;
		output sel;
		input q;
	endclocking
	modport DUV(input d,rst,sel,clk,output q);

	task sync_reset;
		cb.rst<=1'b1;
		cb.sel<=$random;
		cb.d<=1'b1;
		repeat(2)
			@(cb);
		if(cb.q!=0)
			begin
				$display("RESET IS NOT WORKING");
				$stop;
			end
		else
			$display("RESET IS PERFECT");

	endtask
	task load_d0;
		input data;
		cb.rst<=1'b0;
		cb.sel<=1'b0;
		cb.d<=data;
		repeat(2)
			@(cb);
		if(cb.q!==data)
			begin
				$display("LOAD D0 IS NOT WORKING");
				$stop;
			end
		else
			$display("Load D0 IS PERFECT");

	endtask
task load_d1;
input data;
	cb.rst<=1'b0;
	cb.sel<=1'b1;
	cb.d<=~data;
	repeat(2)
		@(cb);
	if(cb.q!==data)
		begin
			$display("LOAD D1 IS NOT WORKING");
			$stop;
		end
	else
		$display("LOAD D1 IS PERFECT");

endtask
//modport TEST(clocking cb,import task sync_reset(),import task load_d0(),import task load_d1());

endinterface

module dff(dff_if.DUV duv_if);
logic d;
	
always@(posedge duv_if.clk)
	begin
		if(duv_if.rst)
			duv_if.q<=0;
		else
			duv_if.q<=d;
	end
endmodule

module testcase(dff_if test_if);

	initial 
		begin
			@(test_if.cb);
			test_if.sync_reset;
			test_if.load_d0(1);
			test_if.load_d1(0);
			#10 $finish;
		end
			

endmodule

module top();
	bit clk;
	always
		#10 clk=~clk;

	dff_if IF(clk);
	dff RTL(IF);
	testcase TB(IF);
endmodule
