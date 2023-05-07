module top;
	mailbox#(int) mbx=new(2);
	
	initial 
		begin
			for(int i=0;i<5;i++)
				begin
				#2;
				mbx.put(i);	
			$display("sender time=%0t,data=%0d,size=%0d",$time,i,mbx.num());
				end

		end


	initial

		begin
			forever
				begin
				int idx;
					
				#2 mbx.get(idx);

			$display("receiver time=%0t,data=%0d,size=%0d",$time,idx,mbx.num());


				end

		end

endmodule
