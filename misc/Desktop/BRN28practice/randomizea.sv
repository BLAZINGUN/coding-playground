//Constraints
/*module top;
	class transaction;
		rand bit[3:0] a;
		constraint undersize{a<=10;}  

	endclass

transaction t_h;
		initial
			begin
				t_h=new;
				repeat(16)
				begin
				t_h.randomize();
				$display("a=%d",t_h.a);
				end
			t_h.undersize.constraint_mode(0);
			$display("....//////////////.......");
				repeat(16)
				begin
				t_h.randomize();
				$display("a=%d",t_h.a);
				end
			t_h.undersize.constraint_mode(1);
			$display("....//////////////.......");
				repeat(16)
				begin
				t_h.randomize();
				$display("a=%d",t_h.a);
				end

			end

endmodule*/
//Constraint Overriding
/*module top;
	class transaction;//Base 
		rand bit[3:0] a;
		constraint undersize{a<=10;}  

	endclass
	class trans_ext extends transaction;//Derived class

		//constraint undersize{a<=5;}
		constraint undersize{a>10;}//overriding the constarints 
		constraint oversize{a>10;}//It will throw error

	endclass

trans_ext t_h;
		initial
			begin
				t_h=new;
				repeat(16)
					begin
						t_h.randomize();
						$display("a=%d",t_h.a);
					end
					
			end

endmodule*/

//Soft constarints
/*module top;
	class transaction;
		rand bit[3:0] a;
		constraint undersize{ soft a<=10;}  

	endclass

transaction t_h;
		initial
			begin
				t_h=new;
				repeat(16)
				begin
				t_h.randomize() with {a>10;};	//inline constarint 	
				$display("a=%d",t_h.a);
	
				end

			end
endmodule*/



//Set membership
/*module top;
	class transaction;
		rand bit[3:0] packet;
		constraint siz{packet  inside  { 2,6,[11:14]}; }

	endclass

transaction t_h;
		initial
			begin
				t_h=new;
				repeat(16)
				begin
				t_h.randomize();		
				$display("packet =%d",t_h.packet);
	
				end

			end
endmodule*/
//Set membership from an array
/*module top;
	class transaction;
		rand bit[3:0] packet;
		bit[3:0] rang[]={1,4,7,9,3,8};
		constraint siz{packet  inside  {rang};}

	endclass

transaction t_h;
		initial
			begin
				t_h=new;
				repeat(16)
				begin
				t_h.randomize();		
				$display("packet =%d",t_h.packet);
	
				end

			end
endmodule*/
/*module top;
	class transaction;
		rand bit[3:0] packet;//0-15
		constraint siz{ packet dist{ 3:=7 ,2:=4,1:=1, [10:11]:/6};}
	endclass

transaction t_h;
		initial
			begin
				t_h=new;
				repeat(16)
				begin
				t_h.randomize();		
				$display("packet =%d",t_h.packet);
	
				end

			end
endmodule*/

//Conditional Constraint
/*module top;
	class transaction;
		rand bit[3:0] packet;
		bit mode;
		constraint tag{ mode==1'b0 -> packet>10;//implication operator->
				 mode==1'b1 -> packet<10;}	
	endclass

transaction t_h;
		initial
			begin
				t_h=new;
				t_h.mode=1'b0;
				repeat(16)
				begin
				
				t_h.randomize();		
				$display("packet =%d",t_h.packet);
	
				end
			$display("///////////////////");
				t_h.mode=1'b1;
				repeat(16)
				begin
				
				t_h.randomize();		
				$display("packet =%d",t_h.packet);
				end
			end
endmodule*/
/*module top;
	class transaction;
		rand bit[3:0] packet;
		bit mode;
		constraint tag{ if(mode==1'b0) packet>10;
				else if(mode==1'b1) packet<10;}
	endclass

transaction t_h;
		initial
			begin
				t_h=new;
				t_h.mode=1'b1;
				repeat(16)
				begin
				
				t_h.randomize();		
				$display("packet =%d",t_h.packet);
	
				end
			end
endmodule*/
//Static Constarints
/*mo26dule top;
	class transaction;
		rand bit[3:0] a;
		static constraint undersize{a<=10;}  

	endclass

transaction t_h1,t_h2;
		initial
			begin
				t_h1=new;
				t_h2=new;
				repeat(16)
				begin
					t_h1.randomize();
					$display("a=%d",t_h1.a);
				end
			t_h2.undersize.constraint_mode(0);
				$display(".....///////////.........");
				repeat(16)
				begin
					t_h1.randomize();
					$display("a=%d",t_h1.a);
				end
			end
endmodule*/

//Extern Constraints
/*module top;
	class transaction;
		rand bit[3:0] a;
		 constraint undersize; 

	endclass
constraint transaction::undersize{a<=10;}

transaction t_h1;
		initial
			begin
				t_h1=new;
				repeat(16)
				begin
					t_h1.randomize();
					$display("a=%d",t_h1.a);
				end
			end
endmodule*/

/*module top;
	class base;

		extern function void disp();	

	endclass
	function void base::disp();
		$display("Iam printing");

		endfunction
base b;
	initial
		begin
			b=new;
			b.disp();
		end

endmodule*/
//Calling a function inside a constraint

/*module top;

	class packet;

		rand bit[3:0] s_addr;
		rand bit[3:0] e_addr;
		constraint valid{e_addr==addr_calc(s_addr);}
			function bit[3:0] addr_calc(bit[3:0] s_addr);
				if(s_addr>8)
					addr_calc=0;

				else
					addr_calc=s_addr+2;


			endfunction

	endclass
packet p_h;
		initial 

			begin
			p_h=new;
			p_h.randomize();
			$display(p_h.s_addr);
			$display(p_h.e_addr);

			end
endmodule*/










