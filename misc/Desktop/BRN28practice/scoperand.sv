module top;
	int a;
		initial

			begin
				std::randomize(a) with {a<10;a>0;};
				$display("%d",a);

			end
				
endmodule
