module logic_test(input reg  y);
	logic a_in ,b_in;
	assign b_in=1'b0;
	assign a_in=1'b1;
initial
	begin
	//	a_in ='b0;
	end
endmodule

module top;
	logic c_out;
	logic_test LT(c_out);
endmodule

