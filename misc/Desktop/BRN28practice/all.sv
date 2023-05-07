/*module top;

	struct {
		string name;
		int rno=17;
		integer a;
		}s1,s2;
	initial
		begin
		s1.name="maven";
		//s1.rno=13;
			s1.a=13;
		s2.name="silicon";
		s2.rno=16;
		
		$display("The name of student1 is %s",s1.name);
		$display("The rno of student1 is %d",s1.a);
		$display("The rno of student1 is %d",s1.rno);
		$display("The student2 details are %p",s2);
		end
endmodule*/

/*module top;
typedef struct {string name;int rno=17;integer a;} st;
st s1,s2;

	initial
		begin
		s1.name="maven";
		s1.rno=13;
			s1.a=13;
		s2.name="silicon";
		s2.rno=16;
		
		$display("The name of student1 is %s",s1.name);
		$display("The rno of student1 is %d",s1.a);
		$display("The rno of student1 is %d",s1.rno);
		$display("The student2 details are %p",s2);
		end

endmodule*/
module top;
	enum {red=7,green=4,blue=3} color;

	initial
		begin
		color=red;
		$display("The color is %s and its value is %0d",color.name,color);
		color=color.next();	
		$display("The color is %s and its value is %0d",color.name,color);
		color=color.next();	
		$display("The color is %s and its value is %0d",color.name,color);
		end
endmodule
