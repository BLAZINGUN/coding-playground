module top;

	class transaction;
		rand bit[2:0] addr;                                      //size=1 5 8 4
		bit[2:0] queue[$];                                     // actual queue 7 5 8 4  2 1 0 3  
		constraint index_val{ if(queue.size!=0)
						foreach(queue[i])
							addr!=queue[i];}

		function void post_randomize();
			queue.push_back(addr);
			if(queue.size==8)
				queue.delete();


		endfunction

	endclass

transaction th1;
	initial
			begin

			th1=new;
			repeat(20 )
				begin
					th1.randomize;
					$display(th1.addr);
				end
			end



endmodule


