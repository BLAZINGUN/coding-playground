module top;

	class packet;
		rand bit[2:0] a,b,c,e;
		rand bit[2:0] d[6];
		constraint rang{unique{a,b,c,e};}
		constraint ran{unique{d};}

	endclass

packet p;
	initial
		begin
			p=new;
				repeat(2)
				begin
				p.randomize();//a!=b!=c!=e
				$display("%d",p.a);
				$display("%d",p.b);
				$display("%d",p.c);
				$display("%d",p.e);
				$display("%p",p.d);
				$display("-------");
				end
			
		end

endmodule
/*module top;

	class packet;
		rand	bit[2:0] a;
		rand	bit[2:0] b;
		constraint sol{b==func(a);solve a before b;}
		
	function bit[2:0] func(bit[2:0] c);
		if(c==0)
			func=5;
		else
			func=6;
		
	endfunction
	


	endclass
packet p;
	initial

		begin
			p=new;
			repeat(5)
				begin
					p.randomize();
				$display("a=%d,b=%d",p.a,p.b);

				end
		end

endmodule*/
/*module top;
bit[3:0] a,b;
	initial
		begin

		std::randomize(a,b) with {a>10;b<10;};
		$display(a,b);
		end
endmodule*/


