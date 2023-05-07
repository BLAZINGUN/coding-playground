module top;
	union {
		int rno;
		bit[3:0] va;
		} st1,st2;
	initial
		begin
		st1.rno=17;
		st1.va=13;
		$display("%p",st1);
	//	st1.a=14;
	//	$display("%p",st1);
	//	st1.name="maven";
	//	$display("The rno is %0d and the name is %0s",st1.rno,st1.name);
		//st2={2,"silicon"};
	//	$display("%p",st2);
		end

endmodule
/*module top;
	typedef struct {
		int rno;//members of struct
		string name;
		} st;//data type
	st st1,st2;
	initial
		begin
		st1.rno=1;
		st1.name="maven";
		$display("The rno is %0d and the name is %s",st1.rno,st1.name);
		st2={2,"silicon"};
		$display("%p",st2);
		end

endmodule*/
