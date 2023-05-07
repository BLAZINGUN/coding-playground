/*module top;

	class account;
		int balance;
		//constructor
		function new();
			balance=10;
		
		endfunction
		function void disp();
			$display("The value of balance is %d",balance);

		endfunction

	endclass
	account a1,a2;

	initial
		begin
			//a1=new();
			//a1.disp();
$display(a1);
			a1=new;
$display(a1);
		//	a2=new(300);
		//	a2.disp();

		end



endmodule*/
/*module top;

	class account;
		int balance;
		function int summary;
		//	summary=balance ;
			return balance;
		endfunction
		task deposit(input int pay);
			balance=balance+pay;
		endtask


	endclass
	account a1,a2;

	initial
		begin
			a1=new();
			a1.deposit(100);
			$display("The balance is %d",a1.summary);
			$display("The balance is %d",a1.balance);
			a1.deposit(400);
			$display("The balance is %d",a1.summary);
			$display("The balance is %d",a1.balance);

		end



endmodule*/
/*module top;

	class account_c;
		int amount;//
		function new(int amount);
			amount=this.amount;
		endfunction

	endclass

account_c a1;
		initial
			begin
				a1=new(12);
				$display(a1.amount);
			end

endmodule*/

/*module top;
	class account;
		int balance ;
	endclass 

account a1,a2;

	initial
		begin
			a1=new;
			a1.balance=23;
			a2=new a1;
			$display(a1.balance);
			$display(a2.balance);
			a2.balance =34;
			$display(a1.balance);
			$display(a2.balance);
		
			

	
		end








endmodule
*/


module top;

	class sub_class;
		int a;
	endclass

	class main_class;
		int b;
		sub_class sb =new;
	endclass
main_class m1,m2;
	initial

		begin

			m1=new;
			m1.b=25;
			m1.sb.a=21;
			$display("%p",m1);
			$display("%p",m1.sb);
			m2=new m1;
			$display("%p",m2);
			$display("%p",m2.sb);
			




		end







endmodule































