module top;
	initial
		begin
			#10;
			fork

				begin
				#20;//th1
				$display("th1");
				end
				begin
				#40;
				$display("th2");
				end
				begin
				#30;
				$display("th3");
				end
			
			join
			disable fork;
			$display("%t",$time);
		end










endmodule
