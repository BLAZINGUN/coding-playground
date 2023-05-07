module top;
	class base;
		virtual task pre_disp();

		endtask; 

	endclass
	class der extends base;
		task pre_disp();
			$display("Iam adding functionality in pre_disp");

		endtask

	endclass
	/////////////
	class driver;
		base b=new;
		task send();
			b.pre_disp();//I knpw need some extra code
			$display("Iam in driver send");
		endtask
	endclass

driver d;
der v;
	initial 
		begin
			d=new;
			d.send();//29
			$display("---------");
			v=new;//crearting object for derived class
			d.b=v;///assigning child to th parent
			d.send();//32 

		end

	




endmodule
