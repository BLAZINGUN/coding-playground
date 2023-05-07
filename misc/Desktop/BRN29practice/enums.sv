module top;
	typedef enum{red,green,blue} col;
	col color;
	int c;
	
	initial
		begin
			color =violet;
			c=color;
			//$display(c);
			//color =col'(3);
			$cast(color,3);
			$display(color.name,color);
			


		end


endmodule
