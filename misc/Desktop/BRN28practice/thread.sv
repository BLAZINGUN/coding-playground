/*module top;
	initial
		begin
			#10;
			fork
				begin 
				#20;//Thread1
				end
				begin 
				#40;//Thread2
				end
				begin 
				#30;//Thread3
				end

			join_none
			$display("exit is at time t=%t",$time);
		end


endmodule*/
module top;
	event ev;//Declaring the event
initial
	begin
		$display("about to drive ctrl after 10 time units");
		#10;
		$display(" ctrl is driven at time t=%t",$time);
		->ev;//Triggering the event
	end
initial
	begin
		$display("about to drive data");
		#20;
		//@(ev);//Waiting for the event
	 wait(ev.triggered);//It can detect the current event which is triggered at the same time
		$display(" data is driven at time t=%t",$time);
	end

endmodule






















