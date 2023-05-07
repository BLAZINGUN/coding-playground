`timescale 10ns/10ps

module up_down_counter_tb;

reg clk,reset,mode;

wire [4:0] dout;

parameter CYCLE = 10;

up_down_counter DUT (clk,reset,mode,dout);

initial  

	begin
		clk = 1'b0;

		forever 

			#(CYCLE/2) clk = ~clk;

	end

task reset_task;
	begin
		@(posedge clk)
			reset = 1'b0;
		@(posedge clk)
			reset = 1'b1;
	end
endtask



task mode_input(input i );
	begin
		@(posedge clk)
			mode  = i;

	end
endtask


initial 
	
	begin
		reset_task;
		#10;
		mode_input(1);
		#170;
		mode_input(0);
		#170;
		$finish;
	end 


initial
	begin
		$monitor("at time = %t , reset = %d , mode = %d  , dout= %d " , $time , reset , mode , dout);
	end

	
endmodule