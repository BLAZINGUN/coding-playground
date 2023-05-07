/*class account;

	int balance;
	function print();
		$display("My balance is %d",balance);
	endfunction
endclass

account acc1,acc2;//handles

module top;
initial
	begin
		acc1=new;
		acc2=new;
		acc1.balance=100;
		acc2.balance=200;
		acc1.print;
		acc2.print;
	end
endmodule*/


/*module top;

class account;

	int balance;
	function void print();
		$display("My balance is %d",balance);
	endfunction
endclass

account acc1,acc2;//handles

initial
	begin
		acc1=new;//constructor
		acc2=new;
		acc1.balance=100;
		acc2.balance=200;
		acc1.print;
		acc2.print;
	end
endmodule*/

/*module top;

class account;

	int balance;
	function new;
	balance =500;
	endfunction
	
	function int print();
		return balance;
	endfunction
endclass

account acc1,acc2;//handles

initial
	begin
		acc1=new;//constructor---new function
		acc2=new;
		//$display("%d",acc1);
	//	$display("%d",acc2);
	//	acc1.balance=100;
	//	acc2.balance=200;
		//acc1.print;
		//acc2.print;
$display("The balance in acc1 is %d",acc1.balance);
$display("The balance in acc2 is %d",acc2.balance);
$display("The balance in acc1 is %d",acc1.print);
$display("The balance in acc2 is %d",acc2.print);

	end

endmodule*/

/*module top;

class account;
	int a;
	function new();
		$display("Iam in new");
	endfunction
endclass
account acc1;

initial
	begin
//	acc1=new;
acc1.a=10;
	//$display(acc1);
	end
endmodule*/

/*module top();

	class account_c;

		int amount;
		function new(int amount);
			this.amount=amount;
		endfunction
	endclass
	
	account_c acc;

	initial
		begin
			acc=new(500);
		$display("%d",acc.amount);
		end
endmodule*/
//Object Assignment
/*module top();
	class account_c;
		int balance ;
		function void  doubleit();
			balance =balance*2;
		endfunction
	
	endclass
account_c acc1,acc2;
initial
	begin
		acc1=new;
		$display("acc1 adrres =%d",acc1);
		acc1.balance=100;
		acc1.doubleit();
		$display("balance =%d",acc1.balance);
		acc2=acc1;
		$display("acc2 address=%d",acc2);
		acc2.doubleit();
		$display("balance =%d",acc1.balance);
		acc1.doubleit();
		$display("balance =%d",acc2.balance);
		$display("acc1 contains %p",acc1);
		$display("acc1 contains %p",acc2);
		
	end

endmodule*/
////////////////////////////////
/* Shallow copy*/

/*module top();
	class account_c;
		int balance ;
		function void  doubleit();
			balance =balance*2;
		endfunction
	
	endclass
account_c acc1,acc2;
initial
	begin
		acc1=new;
		$display("acc1 adrres =%d",acc1);
		acc1.balance=100;
		acc1.doubleit();//200
		$display("balance =%d",acc1.balance);//200
		acc2=new acc1;
		$display("acc2 adrres =%d",acc2);
		$display("balance in acc2 =%d",acc2.balance);//acc2.balance=200
		acc1.doubleit();//acc1.balance=400
		$display("balance in acc2 =%d",acc2.balance);//acc2.balnce=200
		$display("balance in acc1 =%d",acc1.balance);//acc1.balnce=400

		
	end

endmodule*/
/*module top();

	class account_c;

		int a;
		int b;

	endclass

account_c acc1;
initial 
	begin
	acc1=new;
	acc1.a=76;
	acc1.b=75;
	$display("a=%d",acc1.a);
	$display("b=%d",acc1.b);
	$display("it prints all the properties%p",acc1);
	$display("it prints the address of the object %d",acc1);

	end

endmodule*/

