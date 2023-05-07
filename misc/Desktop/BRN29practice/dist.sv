module top;
	class packet;
		static rand bit[2:0] a;
		static constraint tag{ a>5;}
	endclass

packet p1,p2;
	initial
		begin
			p1=new;
			p2=new;
				repeat(4)
					begin
					p1.randomize;
					$display(p1.a);
					$display(p2.a);
				end
			/*p2.tag.constraint_mode(0);
			$display("------");
				repeat(4)
					begin
					p1.randomize;
					$display(p1.a);//0 to 7
				end*/



		end


endmodule
