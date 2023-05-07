module top;
	semaphore sem;
	initial
		begin
			sem=new(1);
			fork
				display();
				display();

			join

		end

	task  display();
		sem.get(1);
			$display($time,"\t current simulation time");
		sem.put(1);
	endtask
endmodule










