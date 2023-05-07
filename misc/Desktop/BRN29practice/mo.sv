module top;

	class base;
		virtual function void send();
			$display("Iam in base");

		endfunction


	endclass
	class derived extends base;
		virtual function void send();//method overriding
			$display("Iam derived ");

		endfunction


	endclass

base b1;
derived d1;
	initial
		begin
			b1=new;
			d1=new;
			b1.send();//Iam in base
			d1.send();// Iam in derived
			b1=d1;//leagal
			//d1=b1;
			b1.send();//base acts like child  Iam in derived 

		end

endmodule
