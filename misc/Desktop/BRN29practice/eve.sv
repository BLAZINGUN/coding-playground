module top;
	event ev;
	initial 
		begin
			$display("about to drive the ctrl after 10 time units");
			#10;
			$display("control is driven at time,t=%0t",$time);
			->ev;//triggering  of event
		end
	initial 
		begin
			$display("about to drive data");
			#10;
		//	@ev;//waiting for the event
			wait(ev.triggered); 
		$display("data is driven at time,t=%t",$time);//@ev cant execute because its stillwaiting
		end
endmodule


















