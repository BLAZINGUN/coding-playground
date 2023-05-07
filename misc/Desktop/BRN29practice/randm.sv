/*module top;

	class transaction;
		 rand bit[3:0] a;//0 1 2 3 4.....11 12 13 14 15
			
			constraint oversize{ a>=7;}
				
			function void post_randomize;

				$display("The randmoized value of a is%d",a);

			endfunction
	endclass
transaction t1;

	initial
		begin


			t1=new;
			repeat(8)
			begin
				t1.randomize();

			end
				t1.oversize.constraint_mode(0);//disablinthe constraint
			$display("_______________");
			repeat(8)
			begin
				t1.randomize();//The values are 0 to 15

			end
				t1.oversize.constraint_mode(1);//Enabling the constraint
			$display("_______________");
			repeat(8)
			begin
				t1.randomize();// The values of 7 to 15

			end
		end
endmodule*/
		
/*module top;

	class transaction;
		 rand bit[3:0] a;//0 1 2 3 4.....11 12 13 14 15
			
			constraint oversize{ a<=13;}
				
			function void post_randomize;

				$display("The randmoized value of a is%d",a);

			endfunction
	endclass
	class trans_ext extends transaction;
		 rand bit[3:0] b;//0 1 2 3 4.....11 12 13 14 15
	
		constraint size{b>=15;}
	endclass
trans_ext t1;

	initial
		begin


			t1=new;
			repeat(8)
			begin
				t1.randomize();

			end
		end
endmodule*/
//Constraint overriding 
module top;

	class transaction;
		 rand bit[3:0] a;//0 1 2 3 4.....11 12 13 14 15
			bit[3:0] arr[]={4,7,12,14};
			constraint seti{a inside {arr};}
				
			function void post_randomize;

				$display("The randmoized value of a is%d",a);

			endfunction
	endclass
	
transaction  t1;

	initial
		begin


			t1=new;
			repeat(10)
			begin
				t1.randomize();

			end
		end
endmodule
