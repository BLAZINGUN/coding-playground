/*module top;
	virtual class packet;//Abstract
		pure virtual function void disp();///definition
			virtual function void disp2();
				$display("Iam in disp2");
			endfunction

	endclass
	class derived extends packet;
		virtual function void disp();//IMplementation
		$display("Iam in derived");
		endfunction
			/*virtual function void disp2();
				$display("Iam in disp2 but in derived");
			endfunction
	endclass
derived d_h;

	initial
		begin
		d_h=new;
		d_h.disp();
		d_h.disp2();
		end

endmodule*/
//Parametrized class
/*module top;
	class vector#(int size=2);
	bit[size-1:0] a;
	endclass

vector#(2) vt1;
vector#(3) vt2;

	initial
		begin
		vt1=new;
		vt1.a=3;
		$display(vt1.a);

		vt2=new;
		vt2.a=7;
		$display(vt2.a);
		end

endmodule*/

module top;

	class vector#(type T =shortint);
		T a;
	endclass
vector vt;
vector#(string) vt2;
		initial
			begin
				vt=new;
				vt.a=234;
				$display(vt.a);
				vt2=new;
				vt2.a="maven";
				$display(vt2.a);
				

			end

endmodule




